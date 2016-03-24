unit PlugLib.AirControl;

interface

uses
  Classes,
  SyncObjs,
  VamLib.Types,
  VamLib.UniqueID,
  PlugLib.AirControl.DelayedTaskList,
  PlugLib.AirControl.TaskQueue,
  PlugLib.AirControl.TaskSyncQueue;

type
  TAirControl = class;
  TBackgroundWorker = class;

  // == TAirControl ==
  // Plugins are multi-threaded. Typically a plugin will be called from an Audio and
  // a GUI thread. All real-time audio processing is completed in the Audio thread,
  // as well as other non-GUI tasks such as state loading/saving etc.
  // Plugins also need to run time and compute intensive tasks in background threads
  // to avoid blocking the GUI and Audio threads.
  // AirControl is designed to help plugins manage their multi-threaded environment.
  // It provides a method to pass tasks off to a background worker thread. It
  // also provides methods to execute code in the GUI and Audio threads. Which
  // helps with synchronisation.

  TAirControl = class
  private
    CS : TFixedCriticalSection;
    BgEventToken : TEvent;
    BackgroundWorker : TBackgroundWorker;
    DelayedTaskQueue : TDelayedTaskList;
    TaskSyncQueue    : TTaskSyncQueue;
    AudioSyncQueue   : TTaskQueue;
    GuiSyncQueue     : TTaskQueue;

    FCapacity: integer;
    FMaxCapacity: integer;
    FGrowBy: integer;
  public
    constructor Create(const Capacity, GrowBy, MaxCapacity : integer);
    destructor Destroy; override;

    function AddDelayedTask(const Task, OnAudioSync, OnGuiSync : TThreadProcedure; const ExecuteDelay : cardinal):TUniqueID;
    function AddTask(const Task, OnAudioSync, OnGuiSync : TThreadProcedure):TUniqueID;

    property Capacity    : integer read FCapacity;
    property GrowBy      : integer read FGrowBy;
    property MaxCapacity : integer read FMaxCapacity;

    procedure ProcessAudioSync; //The ProcessAudioSync() method needs to be reguarlly called from the audio thread.
    procedure ProcessGuiSync;   //The ProcessGuiSync() method needs to be reguarlly called from the GUI thread.
  end;

  TBackgroundWorker = class(TThread)
  strict private
    FAudioSyncQueue : PTaskQueue;
    FGuiSyncQueue   : PTaskQueue;
    FTaskSyncQueue  : PTaskSyncQueue;
    FDelayedTaskList: PDelayedTaskList;
    FSharedEvent    : TEvent;
    procedure ProcessTasks;
  private
  protected
    procedure Execute; override;

    property SharedEventToken      : TEvent           read FSharedEvent          write FSharedEvent;
    property TaskSyncQueue         : PTaskSyncQueue   read FTaskSyncQueue        write FTaskSyncQueue;
    property AudioSyncQueue        : PTaskQueue       read FAudioSyncQueue       write FAudioSyncQueue;
    property GuiSyncQueue          : PTaskQueue       read FGuiSyncQueue         write FGuiSyncQueue;
    property DelayedTaskList       : PDelayedTaskList read FDelayedTaskList      write FDelayedTaskList;
  public
  end;

implementation

uses
  SysUtils,
  WinApi.Windows;

{ TBackgroundWorker }

constructor TAirControl.Create(const Capacity, GrowBy, MaxCapacity : integer);
begin
  FCapacity := Capacity;
  FGrowBy := GrowBy;
  FMaxCapacity := MaxCapacity;

  DelayedTaskQueue := TDelayedTaskList.Create(Capacity, GrowBy, MaxCapacity);
  TaskSyncQueue    := TTaskSyncQueue.Create(Capacity, GrowBy, MaxCapacity);
  AudioSyncQueue   := TTaskQueue.Create(Capacity, GrowBy, MaxCapacity);
  GuiSyncQueue     := TTaskQueue.Create(Capacity, GrowBy, MaxCapacity);

  CS := TFixedCriticalSection.Create;

  BgEventToken := TEvent.Create(nil, true, false, '', false);
  BgEventToken.ResetEvent;

  BackgroundWorker := TBackgroundWorker.Create(true);
  BackgroundWorker.FreeOnTerminate  := false;
  BackgroundWorker.TaskSyncQueue    := @self.TaskSyncQueue;
  BackgroundWorker.AudioSyncQueue   := @self.AudioSyncQueue;
  BackgroundWorker.GuiSyncQueue     := @self.GuiSyncQueue;
  BackgroundWorker.DelayedTaskList  := @self.DelayedTaskQueue;
  BackgroundWorker.SharedEventToken := self.BgEventToken;

  BackgroundWorker.Start;
end;

destructor TAirControl.Destroy;
begin
  //== shut down sequence ==
  BackgroundWorker.Terminate;
  BgEventToken.SetEvent;
  BackgroundWorker.WaitFor;
  FreeAndNil(BackgroundWorker);
  //=======================

  cs.Enter;
  try
    // Normally FreeAndNil() isn't used in a destructor. But this class will
    // be getting used in a multi-threaded context. Locking and freeing to nil
    // might help avoid a bug in the long run. (Although hopefully the design
    // is a bit better than that in the first place!)
    FreeAndNil(DelayedTaskQueue);
    FreeAndNil(TaskSyncQueue);
    FreeAndNil(AudioSyncQueue);
    FreeAndNil(GuiSyncQueue);

    FreeAndNil(BgEventToken);
  finally
    cs.Leave;
  end;
  cs.Free;

  inherited;
end;

function TAirControl.AddDelayedTask(const Task, OnAudioSync, OnGuiSync: TThreadProcedure; const ExecuteDelay: cardinal): TUniqueID;
begin
  cs.Enter;
  try
    result := DelayedTaskQueue.Push(Task, OnAudioSync, OnGuiSync, ExecuteDelay);
  finally
    cs.Leave;
  end;
  BgEventToken.SetEvent; // Set the event so the background thread will start processing.
end;

function TAirControl.AddTask(const Task, OnAudioSync, OnGuiSync: TThreadProcedure): TUniqueID;
begin
  cs.Enter;
  try
    result := TaskSyncQueue.Push(Task, OnAudioSync, OnGuiSync);
  finally
    cs.Leave;
  end;
  BgEventToken.SetEvent; // Set the event so the background thread will start processing.
end;

procedure TAirControl.ProcessAudioSync;
var
  Task : TThreadProcedure;
begin
  while AudioSyncQueue.Pop(Task) do
  begin
    Task();
  end;
end;

procedure TAirControl.ProcessGuiSync;
var
  Task : TThreadProcedure;
begin
  while GuiSyncQueue.Pop(Task) do
  begin
    Task();
  end;
end;

{ TBackgroundThread }

procedure TBackgroundWorker.Execute;
var
  WaitResult : TWaitResult;
begin
  assert(assigned(SharedEventToken));
  while not Terminated do
  begin
    if Terminated then exit;

    case WaitResult of
      wrSignaled, wrTimeout:
      begin
        ProcessTasks;
      end;
      wrAbandoned,
      wrError,
      wrIOCompletion:
      begin
        // TODO:MED what should happen here? For now just raise an exception and see if
        // it occurs in practice.
        raise EVamLibException.Create('BackgroundWorker has terminated unexpectedly. (error 11033)');
      end
    else
      raise EVamLibException.Create('Unexpected wait result.');
    end;

    if DelayedTaskList^.Count > 0
      then WaitResult := SharedEventToken.WaitFor(100)   //Wait for 100 milliseconds.
      else WaitResult := SharedEventToken.WaitFor(2000); //wait for 2 seconds.
  end;

end;

procedure TBackgroundWorker.ProcessTasks;
var
  Task, OnAudioSync, OnGuiSync : TThreadProcedure;
begin
  while DelayedTaskList^.Pop(Task, OnAudioSync, OnGuiSync) do
  begin
    // IMPORTANT: Ordering is important here.

    // 1) Complete the task...
    if assigned(Task)
      then Task();

    // 2) Then push the OnSync tasks to their respective queues.
    if assigned(OnAudioSync)
      then AudioSyncQueue^.Push(OnAudioSync);

    if assigned(OnGuiSync)
      then GuiSyncQueue^.Push(OnGuiSync);
  end;


  while TaskSyncQueue^.Pop(Task, OnAudioSync, OnGuiSync) do
  begin
    // IMPORTANT: Ordering is important here.

    // 1) Complete the task...
    if assigned(Task)
      then Task();

    // 2) Then push the OnSync tasks to their respective queues.
    if assigned(OnAudioSync)
      then AudioSyncQueue^.Push(OnAudioSync);

    if assigned(OnGuiSync)
      then GuiSyncQueue^.Push(OnGuiSync);
  end;
end;

end.
