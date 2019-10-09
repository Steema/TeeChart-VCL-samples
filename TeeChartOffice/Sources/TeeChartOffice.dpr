program TeeChartOffice;
{$I TeeDefs.inc}

{$DEFINE TEEENTERPRISE}

uses
  {$IFDEF FASTMM}
  FastMM4,
  {$ENDIF}
  Forms,
  SysUtils,
  UnitChartOffice in 'UnitChartOffice.pas',
  TeeChartOfficeConstants in 'TeeChartOfficeConstants.pas',
  TeeCommanderEditor in 'TeeCommanderEditor.pas',
  TeeConfig in 'TeeConfig.pas',
  TeeHighLight in 'TeeHighLight.pas',
  TeeOfficeConstants in 'TeeOfficeConstants.pas',
  TeeRecentFiles in 'TeeRecentFiles.pas',
  TeeUpdateVersion in 'TeeUpdateVersion.pas',
  TeeWebGallery in 'TeeWebGallery.pas',
  TeeImportData in 'TeeImportData.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TeeChart Office';

  {$IFDEF D105}
  Application.MainFormOnTaskbar := True;
  {$ENDIF}

  Application.CreateForm(TMainForm, MainForm);
  TrimWorkingSet;
  Application.Run;
end.
