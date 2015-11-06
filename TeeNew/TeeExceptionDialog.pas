unit TeeExceptionDialog;
{$I TeeDefs.inc}

{$IFOPT D+}
{$DEFINE USEJCL}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdMultipartFormData, Buttons;

type
  TExceptionDialog = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    MemoStack: TMemo;
    Splitter1: TSplitter;
    Image1: TImage;
    BitBtn1: TBitBtn;
    Memo2: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel1Resize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Memo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ProblemSent : Boolean;
    FolderID : String;

    procedure SendProblem(const AText:TStrings);
  public
    { Public declarations }

    class function ValidException(E:Exception):Boolean;
    class procedure Show(AOwner:TComponent; E:Exception; const ID:String);
  end;

implementation

{$IFNDEF LCL}
{$ELSE}
{$R *.lfm}
{$ENDIF}
{$R *.dfm}

uses
  Registry,

  {$IFDEF USEJCL}
  JCLDebug,
  {$ENDIF}

  TeePenDlg;

function GetWinVersion: String;
var
  osVerInfo: TOSVersionInfo;
  majorVersion, minorVersion: Cardinal;
  vResult : String;

begin
  Result := 'Unknown';

  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);

  if GetVersionEx(osVerInfo) then
  begin
    minorVersion := osVerInfo.dwMinorVersion;
    majorVersion := osVerInfo.dwMajorVersion;

    result:='Version: '+IntToStr(majorVersion)+'.'+IntToStr(minorVersion)+' ';

    case osVerInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT:
      begin
        if majorVersion <= 4 then
          vResult := 'Windows NT'
        else if (majorVersion = 5) and (minorVersion = 0) then
          vResult := 'Windows 2000'
        else if (majorVersion = 5) and (minorVersion = 1) then
          vResult := 'Windows XP'
        else if (majorVersion = 6) then
        begin
          if minorVersion=0 then
             vResult := 'Windows Vista'
          else
             vResult := 'Windows 7';
        end
        else
          vResult := 'Windows '+IntToStr(majorVersion);
      end;

      VER_PLATFORM_WIN32_WINDOWS:
      begin
        if (majorVersion = 4) and (minorVersion = 0) then
          vResult := 'Windows 95'
        else if (majorVersion = 4) and (minorVersion = 10) then
        begin
          if osVerInfo.szCSDVersion[1] = 'A' then
            vResult := 'Windows 98 SE'
          else
            vResult := 'Windows 98';
        end
        else if (majorVersion = 4) and (minorVersion = 90) then
          vResult := 'Windows ME'
        else
          vResult := 'Unknown';
      end;
    end;

    result:=result+'"'+vResult+'" Build: '+IntToStr(osVerInfo.dwBuildNumber);
  end;
end;

function LocaleToString(LCID : integer) : string;
var Lang : PChar;
    Ctry : PChar;
begin
 result := '';
 Lang := StrAlloc(255);
 Ctry := StrAlloc(255);
 try
  fillchar(Lang^,255,0);
  fillchar(Ctry^,255,0);
  GetLocaleInfo(LCID,LOCALE_SISO639LANGNAME,Lang,255);
  GetLocaleInfo(LCID,LOCALE_SISO3166CTRYNAME,Ctry,255);
  result := Ctry + #32 + Lang;
 finally
  StrDispose(Lang);
  StrDispose(Ctry);
 end;
end;

function CPUname: string;
var
  Reg: TRegistry;
begin
  CPUname := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\Hardware\Description\System\CentralProcessor\0', False) then
      CPUname := Reg.ReadString('Identifier');
  finally
    Reg.Free;
  end;
end;

function GetCpuSpeed: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('Hardware\Description\System\CentralProcessor\0', False) then
    begin
      Result := IntToStr(Reg.ReadInteger('~MHz')) + ' MHz';
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

function IDEVersion:String;
begin
  {$IFDEF D16}result:='RAD XE2'; Exit;{$ENDIF}
  {$IFDEF D15}result:='RAD XE'; Exit;{$ENDIF}
  {$IFDEF D14}result:='RAD 2010'; Exit;{$ENDIF}
  {$IFDEF D12}result:='RAD 2009'; Exit;{$ENDIF}
  {$IFDEF D105}result:='BDS 2.1'; Exit;{$ENDIF}
  {$IFDEF D10}result:='BDS 2.0'; Exit;{$ENDIF}
  {$IFDEF D9}result:='BDS 1.0'; Exit;{$ENDIF}
  {$IFDEF D8}result:='Delphi 8.NET'; Exit;{$ENDIF}
  {$IFDEF D7}result:='Delphi 7'; Exit;{$ENDIF}
  {$IFDEF D6}result:='Delphi 6'; Exit;{$ENDIF}
  {$IFDEF D5}result:='Delphi 5'; Exit;{$ENDIF}
  {$IFDEF D4}result:='Delphi 4'; Exit;{$ENDIF}
  {$IFDEF D3}result:='Delphi 3'; Exit;{$ENDIF}
  {$IFDEF D2}result:='Delphi 2'; Exit;{$ENDIF}
  {$IFDEF D1}result:='Delphi 1'; Exit;{$ENDIF}
end;

procedure AddMachineDetails(ALines:TStrings);

  function IDEPlatform:String;
  begin
    {$IFDEF D16}
    {$IFDEF CPUX64}
    result:=' x64';
    {$ELSE}
    result:=' 32bit';
    {$ELSE}
    result:='';
    {$ENDIF}
    {$ENDIF}
  end;

var S : TMemoryStatus;
begin
  ALines.Add('');

  ALines.Add('IDE: '+IDEVersion+IDEPlatform);
  ALines.Add('System: '+GetWinVersion+', Locale: '+IntToStr(SysLocale.DefaultLCID)+' "'+LocaleToString(SysLocale.DefaultLCID)+'"');
  ALines.Add('CPU: '+CPUname+', '+GetCpuSpeed);

  S.dwLength:=SizeOf(S);
  GlobalMemoryStatus(S);
  ALines.Add('Memory: Total='+IntToStr(S.dwTotalPhys)+', Available: '+IntToStr(S.dwAvailPhys));
end;

function GraphicsDetails:String;
begin
  result:='';

  with TRegistry.Create(KEY_READ) do
  try
    RootKey:=HKEY_LOCAL_MACHINE;

    if OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winsat') then
       if ValueExists('PrimaryAdapterString') then
          result:=ReadString('PrimaryAdapterString');
  finally
    Free;
  end;
end;

procedure AddDisplayDetails(ALines:TStrings);
var
  TempDC: HDC;
  i: Integer;
begin
  TempDC:=GetDC(GetDesktopWindow);
  i:=GetDeviceCaps(TempDC, BITSPIXEL);

  ALines.Add('Screen: '+IntToStr(Screen.Width)+'x'+IntToStr(Screen.Height)+' '+IntToStr(i)+' bits');
  ALines.Add('Graphics: '+GraphicsDetails);
end;

class procedure TExceptionDialog.Show(AOwner:TComponent; E:Exception; const ID:String);
begin
  with TExceptionDialog.Create(AOwner) do
  try
    FolderID:=ID;

    Memo1.Lines.Clear;
    Memo1.Lines.Add(DateTimeToStr(Now));
    Memo1.Lines.Add('');
    Memo1.Lines.Add(E.Message);

    AddMachineDetails(Memo1.Lines);
    AddDisplayDetails(Memo1.Lines);

    {$IFDEF USEJCL}
    MemoStack.Lines.Clear;
    JclLastExceptStackListToStrings(MemoStack.Lines,True,True,True,True);
    {$ELSE}
    SpeedButton1.Visible:=False;
    {$ENDIF}

    ShowModal;
  finally
    Free;
  end;
end;

procedure TExceptionDialog.SendProblem(const AText:TStrings);
var sResponse: String;
    ReqData : TIdMultiPartFormDataStream;
    IdHttp1 : TIdHTTP;
begin
  try
    Screen.Cursor:=crHourGlass;
    IdHttp1:=TIdHTTP.Create(Self);
    try
      IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
      ReqData := TIdMultiPartFormDataStream.Create;
      ReqData.AddFormField('text', AText.Text){$IFDEF D15}.ContentTransfer:=''{$ENDIF};
      sResponse:=IdHTTP1.Post('http://www.steema.us/reports/receive.php?id='+FolderID,ReqData);
    finally
      IdHttp1.Free;
      Screen.Cursor:=crDefault;
    end;

    ShowMessage('Thank You for helping us ! '+#10#13+sResponse);
    Close;
  except
    on E: Exception do
       ShowMessage('Error encountered while sending problem to server: ' + E.Message);
  end;
end;

procedure TExceptionDialog.Button2Click(Sender: TObject);
var s : TStrings;
begin
  try
    s:=TStringList.Create;
    try
      if (Memo2.Tag=0) and (Memo2.Lines.Text<>'') then
      begin
        s.Add('Comments:');
        s.AddStrings(Memo2.Lines);
        s.Add('');
      end;

      s.AddStrings(Memo1.Lines);
      s.Add('');
      s.AddStrings(MemoStack.Lines);

      SendProblem(s);
    finally
      s.Free;
    end;
  finally
    ProblemSent:=True;
  end;
end;

procedure TExceptionDialog.SpeedButton1Click(Sender: TObject);
begin
  MemoStack.Visible:=SpeedButton1.Down;
  Splitter1.Visible:=MemoStack.Visible;
end;

procedure TExceptionDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not ProblemSent then
     if TeeYesNo('Would you like to send us this report?') then
        Button2Click(Self);

  CanClose:=True;
end;

procedure TExceptionDialog.Panel1Resize(Sender: TObject);
begin
  Button1.Left:=Panel1.Width-86;
end;

procedure TExceptionDialog.BitBtn1Click(Sender: TObject);
begin
  Button2Click(Self);
end;

class function TExceptionDialog.ValidException(E: Exception): Boolean;
begin
  result:=(E is EHeapException) or
          (E is EInOutError) or
          (E is EExternal) or
          (E is EInvalidCast) or
          (E is EVariantError) or
          (E is EAssertionFailed) or
          (E is EAbstractError) or
          (E is EIntfCastError) or
          (E is EOSError) or
          (E is ESafecallException);
end;

procedure TExceptionDialog.Memo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Memo2.Tag=1 then
  begin
    Memo2.Clear;
    Memo2.Tag:=0;
    Memo2.Font.Color:=clWindowText;
  end;
end;

{$IFDEF USEJCL}
initialization
  JclStartExceptionTracking;
finalization
  JclStopExceptionTracking;
{$ENDIF}
end.
