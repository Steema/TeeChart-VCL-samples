unit DBChart_AnyDataSet;
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
  DBTables,
  {$ENDIF}
  Base_DBChart, TeeProcs, TeEngine, Chart, DBChart, Series, Db;

type
  TDBChartAny = class(TBaseDBChart)
    Table1: TTable;
    Series1: TPieSeries;
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

procedure TDBChartAny.CheckBox1Click(Sender: TObject);
begin
  Table1.Active:=CheckBox1.Checked;
end;

procedure TDBChartAny.FormShow(Sender: TObject);
begin
  inherited;
  CheckTable(Table1);
end;

initialization
  RegisterClass(TDBChartAny);
end.
