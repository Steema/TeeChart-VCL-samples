program DBChartAgg;

uses
  Forms,
  Base_DBChart in 'Base_DBChart.pas' {BaseDBChart},
  DBChart_Aggregates in 'DBChart_Aggregates.pas' {DBChartAggregate};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'TeeChart Pro 5 - DBChart and Aggregate fields';
  Application.CreateForm(TDBChartAggregate, DBChartAggregate);
  Application.Run;
end.
