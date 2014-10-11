unit SmartInspectLogging;

interface

uses
  VamLib.LoggingProxy,
  SmartInspect;

var
  Si: TSmartInspect;
  LogMain : TSiSession;
  VamLibLog : TSiSession;
  LogSpecial : TSiSession;

type
  TSmartInspectProxy = class(TInterfacedObject, ILoggingProxy)
  private
    procedure LogMessage(const aTitle : string);
    procedure LogError(const aTitle : string);
    procedure TrackMethod(const aMethodName : string);
  end;

implementation

uses
  SysUtils;

var
  Connections : string;

{ TSmartInspectProxy }

procedure TSmartInspectProxy.LogError(const aTitle: string);
begin
  VamLibLog.LogError(aTitle);
end;

procedure TSmartInspectProxy.LogMessage(const aTitle: string);
begin
  VamLibLog.LogMessage(aTitle);
end;

procedure TSmartInspectProxy.TrackMethod(const aMethodName: string);
begin
  VamLibLog.TrackMethod(aMethodName);
end;

initialization
  Si := TSmartInspect.Create(ExtractFileName(ParamStr(0)));

  LogMain   := Si.AddSession('Main', True);
  VamLibLog := Si.AddSession('VamLib', True);
  LogSpecial := si.AddSession('LogSpecial', true);
  LogSpecial.Active := false;

  Connections := 'pipe(reconnect=true, reconnect.interval=1s)';

  si.Connections := Connections;
  Si.Enabled := true;

  LogMain.LogMessage('Logging Initialized.');
  VamLibLog.LogMessage('VamLibLog Created');



  //LogMain.LogMessage();

finalization
  // NOTE: HACK: Clearing the proxy here feels hackish.. Dunno. Maybe it needs to be setup in another unit.
  VamLib.LoggingProxy.Log.ClearProxy;

  VamLibLog := nil;
  LogMain := nil;
  LogSpecial := nil;
  FreeAndNil(Si);

end.
