unit VamLib.Throttler;

interface

uses
  ExtCtrls,
  SysUtils,
  VamLib.UniqueID,
  VamLib.Collections.Lists;


//==============================================================================
//        high level global functions.
//==============================================================================
procedure Throttle(const Handle : TUniqueID; Time: integer; Task : TProc);

// TODO:HIGH need a clear throttle method.


//==============================================================================
//        Low level type declarations
//==============================================================================
type
  PThrottleInfo = ^TThrottleInfo;
  TThrottleInfo = record
    Handle     : TUniqueID;
    Task       : TProc;
    HoldTime   : cardinal; //The desired throttled time delay.
    TimeCalled : TDateTime;
    CallAgain  : boolean;
  end;

  TInfoList = class(TSimpleRecordList<TThrottleInfo>)
  public
    function FindOrCreate(ID : TUniqueID):PThrottleInfo;
    function Find(ID : TUniqueID):PThrottleInfo;
  end;

  TThrottleController = class
  private
    TaskList : TInfoList;
    Timer : TTimer;
    procedure HandleTimerEvent(Sender : TObject);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Throttle(const Handle : TUniqueID; Time: integer; Task : TProc);
  end;


implementation

uses
  VamLib.LoggingProxy,
  DateUtils;

var
  GlobalThrottler  : TThrottleController;

procedure Throttle(const Handle : TUniqueID; Time: integer; Task : TProc);
begin
  if not assigned(GlobalThrottler) then GlobalThrottler := TThrottleController.Create;
  GlobalThrottler.Throttle(Handle, Time, Task);
end;

{ TThrottler }

constructor TThrottleController.Create;
begin
  TaskList := TInfoList.Create;
  Timer := TTimer.Create(nil);
  //Timer.UseMainThreadForTimerEvent := false;
  Timer.Interval := 5;
  Timer.OnTimer := HandleTimerEvent;
  Timer.Enabled       := true;
end;

destructor TThrottleController.Destroy;
begin
  Timer.Free;
  TaskList.Free;
  inherited;
end;

procedure TThrottleController.HandleTimerEvent(Sender: TObject);
var
  c1: Integer;
  TaskInfo : PThrottleInfo;
  ms : Int64;
begin
  for c1 := TaskList.Count-1 downto 0 do
  begin
    TaskInfo := @TaskList.Raw[c1];

    if TaskInfo^.CallAgain then
    begin
      ms := MilliSecondsBetween(Now, TaskInfo^.TimeCalled);
      if (ms >= TaskInfo^.HoldTime)  then
      begin
        TaskInfo^.CallAgain := false;
        TaskInfo^.Task();
        TaskInfo^.TimeCalled := Now;
      end;
    end else
    begin
      ms := MilliSecondsBetween(Now, TaskInfo^.TimeCalled);
      if (ms >= TaskInfo^.HoldTime * 2)  then
      begin
        TaskList.Delete(c1);
      end;
    end;
  end;


end;

procedure TThrottleController.Throttle(const Handle: TUniqueID; Time: integer; Task: TProc);
var
  TaskInfo : PThrottleInfo;
begin
  TaskInfo := TaskList.Find(Handle);
  if not assigned(TaskInfo) then
  begin
    Task();

    TaskInfo := TaskList.FindOrCreate(Handle);
    TaskInfo^.Task       := Task;
    TaskInfo^.HoldTime   := Time;
    TaskInfo^.CallAgain  := false;
    TaskInfo^.TimeCalled := Now;
  end else
  begin
    TaskInfo^.CallAgain := true;
  end;
end;

{ TTaskList }

function TInfoList.Find(ID: TUniqueID): PThrottleInfo;
var
  c1: Integer;
begin
  for c1 := 0 to self.Count-1 do
  begin
    if self[c1].Handle = ID
      then exit(@self.Raw[c1]);
  end;

  result := nil;
end;

function TInfoList.FindOrCreate(ID: TUniqueID): PThrottleInfo;
var
  c1: Integer;
  ptr : PThrottleInfo;
begin
  for c1 := 0 to self.Count-1 do
  begin
    if self[c1].Handle = ID
      then exit(@self.Raw[c1]);
  end;

  ptr := New;
  ptr^.Handle := ID;
  result := ptr;
end;

initialization

finalization
  if assigned(GlobalThrottler)
    then GlobalThrottler.Free;
end.
