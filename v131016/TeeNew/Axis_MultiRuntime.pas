unit Axis_MultiRuntime;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TAxisMultiRuntime = class(TBaseForm)
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TAxisMultiRuntime.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Series2.VertAxis:=aLeftAxis;
    Series3.VertAxis:=aLeftAxis;
    Chart1.LeftAxis.EndPosition:=100;
  end
  else
  begin
    Series2.CustomVertAxis:=Chart1.CustomAxes[0];
    Series3.CustomVertAxis:=Chart1.CustomAxes[1];
    Chart1.Axes.Left.EndPosition:=30;
  end;
end;

procedure TAxisMultiRuntime.FormCreate(Sender: TObject);
var Axis : TChartAxis;
begin
  inherited;
  { random data }
  Chart1.SeriesList.FillSampleValues(1000);

  { create the axes... }
  Chart1.CustomAxes.Clear;
  Axis := Chart1.CustomAxes.Add as TChartAxis;
  Axis.StartPosition:=30;
  Axis.EndPosition:=60;
  Axis.Axis.Color:=Series2.SeriesColor;
  Series2.CustomVertAxis:=Axis;

  Axis := Chart1.CustomAxes.Add as TChartAxis;
  Axis.StartPosition:=60;
  Axis.EndPosition:=100;
  Axis.Axis.Color:=Series3.SeriesColor;
  Series3.CustomVertAxis:=Axis;

  Series1.GetVertAxis.EndPosition:=30;
end;

initialization
  RegisterClass( TAxisMultiRuntime );
end.
