program TeeMaps;
{$I TeeDefs.inc}

uses
  {$IFDEF CLX}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  UnitTestSHP in 'UnitTestSHP.pas' {Form1};

{$R *.res}

{$IFDEF CLR}
[STAThread]
{$ENDIF}
begin
  Application.Initialize;
  Application.Title := 'TeeChart GIS / Mapping Example';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
