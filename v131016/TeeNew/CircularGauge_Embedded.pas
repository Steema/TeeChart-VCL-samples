unit CircularGauge_Embedded;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  {$IFDEF D6}
  Types,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeCircularGauge,
  TeeNumericGauge, TeeLinearGauge;

type
  TCircularGaugeEmbeddedForm = class(TBaseForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    CircularGauge: TCircularGauge;
    NumericGauge: TNumericGauge;
    LinearGauge: TLinearGauge;
    Increment: Double;

    procedure BeforeDrawValuesCircularGauge(Sender: TObject);

    procedure SetUpNGauge;
    procedure SetUpLGauge;
    procedure DrawNGauge;
    procedure DrawLGauge;
    function CalcNGaugeBounds: TRect;
    function CalcLGaugeBounds: TRect;
  public
    { Public declarations }
  end;

implementation

uses TeeSpline, Math;

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCircularGaugeEmbeddedForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D:=false;
  Chart1.Legend.Visible:=false;
  Chart1.Title.Font.Color:=RGB(255,255,255);
  Chart1.Title.Caption:='Embedded Gauges';

  CircularGauge:=TCircularGauge.Create(Self);
  Chart1.AddSeries(CircularGauge);
  CircularGauge.RotationAngle:=270;
  CircularGauge.TotalAngle:=180;
  CircularGauge.Axis.LabelsFont.Size:=8;
  CircularGauge.Axis.LabelsFont.Color:=CircularGauge.GetPaletteColor(20);
  CircularGauge.RedLine.Visible:=False;
  CircularGauge.GreenLine.Visible:=False;
  CircularGauge.BeforeDrawValues:=BeforeDrawValuesCircularGauge;
  CircularGauge.Value:=0;
  CircularGauge.GreenLine.Pen.Visible := False;
  CircularGauge.RedLine.Pen.Visible := False;

  SetUpNGauge;
  SetUpLGauge;

  Increment:=0;
  Timer1.Interval:=50;
  Timer1.Enabled:=True;
  Randomize;
end;

procedure TCircularGaugeEmbeddedForm.SetUpNGauge;
var Axis: TChartAxis;
begin
  Axis:=TChartAxis.Create(Chart1);
  Axis.Horizontal:=True;
  NumericGauge:=TNumericGauge.Create(Chart1);
  Chart1.AddSeries(NumericGauge);
  NumericGauge.HorizAxis:=aCustomHorizAxis;
  NumericGauge.Embedded:=True;
  NumericGauge.CustomHorizAxis:=Axis;
  NumericGauge.TextMarker.Active:=False;
  NumericGauge.UnitsMarker.Active:=False;
  NumericGauge.ValueFormat:='##00.0';
  NumericGauge.ValueMarker.Shape.Font.Size:=14;
end;

procedure TCircularGaugeEmbeddedForm.SetUpLGauge;
var AxisH, AxisV: TChartAxis;
begin
  AxisH:=TChartAxis.Create(Chart1);
  AxisV:=TChartAxis.Create(Chart1);
  AxisH.Horizontal:=True;
  AxisV.Horizontal:=False;
  LinearGauge:=TLinearGauge.Create(Chart1);
  Chart1.AddSeries(LinearGauge);
  LinearGauge.HorizAxis:=aCustomHorizAxis;
  LinearGauge.VertAxis:=aCustomVertAxis;
  LinearGauge.Horizontal:=False;
  LinearGauge.Embedded:=True;
  LinearGauge.CustomHorizAxis:=AxisH;
  LinearGauge.CustomVertAxis:=AxisV;
  LinearGauge.Axis.Title.Font.Size:=8;
  LinearGauge.Axis.Title.Font.Color:=clWhite;
  LinearGauge.Axis.Title.Caption:='Independent value';
  LinearGauge.Axis.Title.Angle:=90;
  LinearGauge.Axis.LabelsFont.Size:=7;
  LinearGauge.Axis.LabelsFont.Color:=clGreen;
  LinearGauge.Axis.Increment:=20;
  LinearGauge.RedLine.Visible:=False;
  LinearGauge.GreenLine.Visible:=False;
  LinearGauge.Frame.Visible:=False;
  LinearGauge.Face.Transparent:=True;
end;

function TCircularGaugeEmbeddedForm.CalcNGaugeBounds: TRect;
begin
  Result:=TeeRect(CircularGauge.CircleXCenter - Round(CircularGauge.XRadius*2/3.75),
                  CircularGauge.CircleYCenter - (CircularGauge.YRadius*2) div 10,
                  CircularGauge.CircleXCenter - (CircularGauge.XRadius*2) div 12,
                  CircularGauge.CircleYCenter + (CircularGauge.YRadius*2) div 10);
end;

function TCircularGaugeEmbeddedForm.CalcLGaugeBounds: TRect;
begin
  Result:=TeeRect(CircularGauge.CircleXCenter + (CircularGauge.XRadius*2) div 7,
                  CircularGauge.CircleYCenter - (CircularGauge.YRadius*2) div 3,
                  CircularGauge.CircleXCenter + (CircularGauge.XRadius*2) div 4,
                  CircularGauge.CircleYCenter + (CircularGauge.YRadius*2) div 3);
end;

procedure TCircularGaugeEmbeddedForm.DrawNGauge;
begin
  NumericGauge.CustomBounds:=CalcNGaugeBounds;
  NumericGauge.Value:=CircularGauge.Value;
end;

procedure TCircularGaugeEmbeddedForm.DrawLGauge;
begin
  LinearGauge.CustomBounds:=CalcLGaugeBounds;
  LinearGauge.Value:=Random(100);
end;

procedure TCircularGaugeEmbeddedForm.BeforeDrawValuesCircularGauge(Sender: TObject);
begin
  DrawNGauge;
  DrawLGauge;
end;

procedure TCircularGaugeEmbeddedForm.Timer1Timer(Sender: TObject);
begin
  inherited;

  if (CircularGauge.Value>=100) then Increment:=-0.1;
  if (CircularGauge.Value<=0) then Increment:=0.1;

  CircularGauge.Value:=CircularGauge.Value+Increment;
end;

initialization
  RegisterClass(TCircularGaugeEmbeddedForm);
end.
