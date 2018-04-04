program TeeChartOffice;

uses
  FMX.Forms,
  UnitMain_Office in 'UnitMain_Office.pas' {MainOffice};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainOffice, MainOffice);
  Application.Run;
end.
