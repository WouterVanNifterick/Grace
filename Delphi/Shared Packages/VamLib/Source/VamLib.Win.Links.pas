unit VamLib.Win.Links;

interface

function GetLinkTarget(const LinkFileName : string) : string;
function ResolveLinkTarget(const LinkFileName : string) : string;

implementation

uses
  VamLib.Types,
  System.Win.ComObj,
  SysUtils, Windows, ShlObj, ActiveX;

// function GetLinkTarget()
// Source: http://delphi.about.com/od/windowsshellapi/l/aa072704a.htm
function  GetLinkTarget(const LinkFileName : string) : string;
var
   psl  : IShellLink;
   ppf  : IPersistFile;
   WidePath  : Array[0..MAX_PATH] of WideChar;
   Info      : Array[0..MAX_PATH] of Char;
   wfs       : TWin32FindData;
   lpMultiByteString : PAnsiChar;
begin
  if FileExists(LinkFileName) = false
    then raise Exception.Create('File not found. "' + LinkFileName + '"');

  if UpperCase(ExtractFileExt(LinkFileName)) <> '.LNK'
    then raise Exception.Create('This is not a .LNK file.');

  // CoCreateInstance() docs.
  // https://msdn.microsoft.com/en-us/library/windows/desktop/ms686615%28v=vs.85%29.aspx
  try
    OleCheck( CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER, IShellLink, psl) );
  except
    on EOleSysError
      do exit(''); // ====>> exit - return an empty string >>=====>>
    else
      raise;
  end;

  if psl.QueryInterface(IPersistFile, ppf) = 0 then
  begin
    lpMultiByteString := PAnsiChar(AnsiString(LinkFileName));
    MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, lpMultiByteString, -1, @WidePath, MAX_PATH);
    ppf.Load(WidePath, STGM_READ);
    psl.GetPath(@info, MAX_PATH, wfs, SLGP_UNCPRIORITY);
    Result := info;
  end
  else
    Result := '';

end;

function  ResolveLinkTarget(const LinkFileName : string) : string;
var
   psl  : IShellLink;
   ppf  : IPersistFile;
   WidePath  : Array[0..MAX_PATH] of WideChar;
   Info      : Array[0..MAX_PATH] of Char;
   wfs       : TWin32FindData;
   lpMultiByteString : PAnsiChar;
begin
  if FileExists(LinkFileName) = false
    then raise Exception.Create('File not found. "' + LinkFileName + '"');

  if UpperCase(ExtractFileExt(LinkFileName)) <> '.LNK'
    then raise Exception.Create('This is not a .LNK file.');

  // CoCreateInstance() docs.
  // https://msdn.microsoft.com/en-us/library/windows/desktop/ms686615%28v=vs.85%29.aspx
  OleCheck( CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER, IShellLink, psl) );
  if psl.QueryInterface(IPersistFile, ppf) = 0 then
  begin
    lpMultiByteString := PAnsiChar(AnsiString(LinkFileName));
    MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, lpMultiByteString, -1, @WidePath, MAX_PATH);
    ppf.Load(WidePath, STGM_READ);
    psl.Resolve(0,SLR_NO_UI); // <-- Resolve the link target!
    psl.GetPath(@info, MAX_PATH, wfs, SLGP_UNCPRIORITY);
    Result := info;
  end
  else
    Result := '';
end;

end.
