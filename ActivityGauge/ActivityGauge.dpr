program ActivityGauge;

uses
  Forms,
  Unit1 in 'Unit1.pas' {ActivityGaugeForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TActivityGaugeForm, ActivityGaugeForm);
  Application.Run;
end.
