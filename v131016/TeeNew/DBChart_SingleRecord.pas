unit DBChart_SingleRecord;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons, QGrids, QDBGrids, QDBCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons, Grids, DBGrids, DBCtrls, DBTables,
  {$ENDIF}
  Base_DBChart, Db, TeeProcs, TeEngine, Chart, Series, DBChart;

type
  TDBChartSingleRecord = class(TBaseDBChart)
    DBGrid1: TDBGrid;
    Table1: TTable;
    Series1: TBarSeries;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TDBChartSingleRecord.CheckBox1Click(Sender: TObject);
begin
  Table1.Active:=CheckBox1.Checked;
end;

procedure TDBChartSingleRecord.FormShow(Sender: TObject);
begin
  inherited;
  CheckTable(Table1);
end;

initialization
  RegisterClass(TDBChartSingleRecord);
end.
