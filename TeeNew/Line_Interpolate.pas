unit Line_Interpolate;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools;

type
  TLineInterpolateForm = class(TBaseForm)
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    Series2: TLineSeries;
    Series3: TLineSeries;
    ChartTool1: TCursorTool;
    ChartTool2: TGridBandTool;
    procedure FormCreate(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure ChartTool1Change(Sender: TCursorTool; x, y: Integer;
      const XValue, YValue: Double; Series: TChartSeries;
      ValueIndex: Integer);
  private
    { Private declarations }
    xval: Double;
    function InterpolateLineSeries(Series: TChartSeries;XValue: Double): Double; overload;
    function InterpolateLineSeries(Series: TChartSeries; FirstIndex,
                                  LastIndex: Integer; XValue: Double): Double; overload;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TLineInterpolateForm.FormCreate(Sender: TObject);
var i: Integer;
begin
  inherited;

  for i:=0 to Chart1.SeriesCount-1 do
    Chart1[i].FillSampleValues;
end;

function TLineInterpolateForm.InterpolateLineSeries(Series: TChartSeries;
  XValue: Double): Double;
begin
  result:=InterpolateLineSeries(Series,Series.FirstDisplayedIndex,Series.LastValueIndex,XValue);
end;

function TLineInterpolateForm.InterpolateLineSeries(Series: TChartSeries;
  FirstIndex, LastIndex: Integer; XValue: Double): Double;
var
  Index: Integer;
  dx,dy: Double;
begin
  for Index:=FirstIndex to LastIndex do
    if Series.XValues.Value[Index]>XValue then break;

  //safeguard
  if (Index<1) then Index:=1
  else if (Index>=Series.Count) then Index:=Series.Count-1;

  // y=(y2-y1)/(x2-x1)*(x-x1)+y1
  dx:=Series.XValues.Value[Index] - Series.XValues.Value[Index-1];
  dy:=Series.YValues.Value[Index] - Series.YValues.Value[Index-1];

  if (dx<>0) then
    result:=dy*(XValue - Series.XValues.Value[Index-1])/dx + Series.YValues.Value[Index-1]
  else result:=0;
end;

procedure TLineInterpolateForm.Chart1AfterDraw(Sender: TObject);
var xs, ys, i: Integer;
begin
  if CheckBox1.Checked then
  begin
    xs := Chart1.Axes.Bottom.CalcXPosValue(xval);

    for i:=0 to Chart1.SeriesCount - 1 do
    begin
      ys := Chart1[i].GetVertAxis.CalcYPosValue(InterpolateLineSeries(Chart1[i],xval));
      Chart1.Canvas.Brush.Color := Chart1[i].Color;
      TLineSeries(Chart1[i]).Pointer.Draw(xs,ys);
    end;
  end;
end;

procedure TLineInterpolateForm.ChartTool1Change(Sender: TCursorTool; x,
  y: Integer; const XValue, YValue: Double; Series: TChartSeries;
  ValueIndex: Integer);
var
  i: Integer;
begin
  xval := XValue;

  With Chart1.Title.Text do
  begin
    Clear;
    for i:=0 to Chart1.SeriesCount - 1 do
        Add(Chart1[i].Name + ': Y('+FloatToStrF(XValue, ffNumber, 8, 2)+')= ' +
            FloatToStrF(InterpolateLineSeries(Chart1[i],XValue), ffNumber, 8, 2));
  end;
end;

initialization
  RegisterClass(TLineInterpolateForm);
end.
