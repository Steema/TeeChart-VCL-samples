unit DBChart_Speed;
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
  Base_DBChart, TeEngine, Series, Db, TeeProcs, Chart, DBChart;

type
  TDBChartSpeed = class(TBaseDBChart)
    Table1: TTable;
    Series1: TBarSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
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

procedure TDBChartSpeed.CheckBox1Click(Sender: TObject);
begin
  Table1.Active:=CheckBox1.Checked;
  Label1.Visible:=CheckBox1.Checked;
  if Table1.Active then
     Label1.Caption:='Processed records: '+IntToStr(Table1.RecordCount);
end;

procedure TDBChartSpeed.FormShow(Sender: TObject);
begin
  inherited;
  CheckTable(Table1);
end;

initialization
  RegisterClass(TDBChartSpeed);
end.
