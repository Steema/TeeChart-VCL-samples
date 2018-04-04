program TeePerfMonitor;
{$I TeeDefs.inc}

uses
  {$IFDEF CLX}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  FrmMain in 'FrmMain.pas' {MainForm},
  TeePerfCounter in 'TeePerfCounter.pas';

{$R *.RES}

{$IFDEF CLR}
[STAThread]
{$ENDIF}
begin
  Application.Initialize;
  Application.Title := 'TeeChart Performance Monitor';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
