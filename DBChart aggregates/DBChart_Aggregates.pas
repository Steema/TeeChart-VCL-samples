unit DBChart_Aggregates;

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  Base_DBChart, TeeProcs, TeEngine, Chart, DBChart, Db,
  DBTables, DBClient, Provider, Series, DBEditCh, EditChar,
  TeeEditPro;

type
  TDBChartAggregate = class(TBaseDBChart)
    Series1: TBarSeries;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    Table1: TTable;
    ClientDataSet1Total: TAggregateField;
    ClientDataSet1MyItemsTotal: TAggregateField;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var DBChartAggregate : TDBChartAggregate;

implementation

{$R *.DFM}

procedure TDBChartAggregate.FormShow(Sender: TObject);
begin
  inherited;
  CheckTable(Table1);
end;

procedure TDBChartAggregate.Memo1DblClick(Sender: TObject);
begin
  EditChart(Self,DBChart1);
end;

procedure TDBChartAggregate.Button1Click(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  try
    Series1.YValues.ValueSource:='MyTotal;MyItemsTotal';  { <-- aggregate fields }

    { things to remember: }
    ClientDataSet1.AggregatesActive:=True;

    Table1.Active:=True;
    ClientDataSet1.Active:=Table1.Active;

    Button1.Enabled:=False;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

initialization
  RegisterClass(TDBChartAggregate);
end.
