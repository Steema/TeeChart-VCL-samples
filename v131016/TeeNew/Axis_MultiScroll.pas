unit Axis_MultiScroll;
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
  Base, CandleCh, Series, OHLChart, TeEngine, TeeProcs, Chart;

type
  TMultiAxisScroll = class(TBaseForm)
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TCandleSeries;
    Series4: TVolumeSeries;
    Label1: TLabel;
    CheckBoxRed: TCheckBox;
    CheckBoxBlue: TCheckBox;
    CheckBoxGreen: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Chart1Scroll(Sender: TObject);
  private
    { Private declarations }
    Green,Blue : TChartAxis;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses Math, TeCanvas;

procedure TMultiAxisScroll.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(100);

  { change the Left axis properties }
  With Chart1.LeftAxis do
  begin
    Axis.Color:=clRed;
    StartPosition:=0;
    EndPosition:=33;
  end;

  { create custom axes. This can be done at design-time
    with the chart editor. }
  Green:=TChartAxis.Create(Chart1.CustomAxes);
  With Green do
  begin
   Axis.Color:=clGreen;
   StartPosition:=33;
   EndPosition:=66;
  end;

  Blue:=TChartAxis.Create(Chart1.CustomAxes);
  With Blue do
  begin
   Axis.Color:=clBlue;
   StartPosition:=66;
   EndPosition:=100;
  end;

  { associate series }
  Series1.VertAxis:=aLeftAxis;
  Series2.VertAxis:=aLeftAxis;
  Series3.CustomVertAxis:=Green;
  Series4.CustomVertAxis:=Blue;
end;

{ limit scroll }
procedure TMultiAxisScroll.Chart1Scroll(Sender: TObject);
var tmpMin, tmpMax : Double;
begin
  if not CheckBoxRed.Checked then
  begin
    tmpMin:=Min(Series1.YValues.MinValue,Series2.YValues.MinValue);
    tmpMax:=Max(Series1.YValues.MaxValue,Series2.YValues.MaxValue);
    Chart1.LeftAxis.SetMinMax(tmpMin,tmpMax);
  end;

  if not CheckBoxGreen.Checked then
     Green.SetMinMax(Series3.YValues.MinValue,Series3.YValues.MaxValue);

  if not CheckBoxBlue.Checked then
     Blue.SetMinMax(Series4.YValues.MinValue,Series4.YValues.MaxValue);
end;

initialization
  RegisterClass(TMultiAxisScroll);
end.
