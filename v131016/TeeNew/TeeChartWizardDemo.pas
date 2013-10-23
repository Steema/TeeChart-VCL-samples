unit TeeChartWizardDemo;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  {$IFDEF CLR}
  System.Text,
  {$ENDIF}
  TeeExpForm, TeePenDlg;

type
  TChartWizardDemo = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    OldClick : TNotifyEvent;
    procedure ClickNext(Sender: TObject);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses TeeStore, TeeConst, ShellApi, Registry;

// Returns True if TeeChartOffice.exe is installed in this machine...
Function ExistsTeeChartOffice:Boolean;
begin
  with TRegistry.Create do
  try
    RootKey:=HKEY_CLASSES_ROOT;
    result:=KeyExists('.tee');
  finally
    Free;
  end;
end;

procedure TChartWizardDemo.FormShow(Sender: TObject);
begin
  // create Wizard dialog
  With TTeeDlgWizard.Create(Self) do
  begin
    BorderStyle:=TeeFormBorderStyle;
    BorderIcons:=[];
    CancelBtn.Visible:=False;
    HelpButton.Visible:=False;
    Position:=poDefault;

    // Use TeeChartOffice as a viewer when Wizard is finished
    if ExistsTeeChartOffice then
    begin
      OldClick:=NextButton.OnClick;
      NextButton.OnClick:=Self.ClickNext;
    end;

    Align:=alClient;
    Parent:=Self;

    // show wizard
    Show;
  end;
end;

procedure TChartWizardDemo.ClickNext(Sender: TObject);
type TPathName={$IFDEF CLR}StringBuilder{$ELSE}Array[0..MAX_PATH] of Char{$ENDIF};
var tmpPath,
    tmpName : TPathName;
begin
  with (TComponent(Sender).Owner as TTeeDlgWizard) do
  if PageControl.ActivePage=TabSheet2 then
  begin
    {$IFDEF LINUX}
    StrPCopy(tmpPath,'/tmp');
    {$ELSE}

    {$IFDEF CLR}
    tmpPath:=nil;
    {$ENDIF}

    if GetTempPath(MAX_PATH,tmpPath)=0 then
       Raise Exception.Create(TeeMsg_CanNotFindTempPath);
    {$ENDIF}

    {$IFDEF CLR}
    tmpName:=nil;
    {$ENDIF}

    { set the filename to "\temp\temp.tee" }
    {$IFDEF LINUX}
    StrPCopy(tmpName,StrPas(tmpPath)+'/temp.tee');
    {$ELSE}

    {$IFDEF CLR}
//    tmpName:=tmpPath.ToString++'\temp.tee';
    {$ELSE}
    StrPCopy(tmpName,StrPas(tmpPath)+'\temp.tee');
    {$ENDIF}

    {$ENDIF}

    // Store chart to "temp.tee" file
    SaveChartToFile(PreviewChart,tmpName{$IFDEF CLR}.ToString{$ENDIF});

    {$IFNDEF CLR}
    // Launch TeeChartOffice to view finished chart
    ShellExecute(Handle,'open',tmpName,nil,nil,SW_SHOWNORMAL);
    {$ENDIF}
  end
  else OldClick(Sender);
end;

initialization
  RegisterClass(TChartWizardDemo);
end.
