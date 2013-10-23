unit BoxPlot_Series;
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
  {$ENDIF}
  Base, TeEngine, Series, TeeBoxPlot, TeeProcs, Chart;

type
  TBoxPlotForm = class(TBaseForm)
    Series1: TBoxSeries;
    Series2: TBoxSeries;
    Series3: TBoxSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TBoxPlotForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.AddArray([3,6,8,15,19,21]);
  Series2.AddArray([3,6,8,15,19,21]);
  Series3.AddArray([3,6,8,15,19,21]);
end;

procedure TBoxPlotForm.CheckBox1Click(Sender: TObject);
var tmp : TChartSeriesClass;
begin
  if CheckBox1.Checked then tmp:=TBoxSeries
                       else tmp:=THorizBoxSeries;
  ChangeAllSeriesType(Chart1,tmp);
end;

initialization
  RegisterClass(TBoxPlotForm);
end.
