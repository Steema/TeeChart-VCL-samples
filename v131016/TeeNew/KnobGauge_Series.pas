unit KnobGauge_Series;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeKnobGauge,
  TeeNumericGauge;

type
  TKnobGauge_SeriesForm = class(TBaseForm)
    cbAnimate: TCheckBox;
    Timer1: TTimer;
    Timer2: TTimer;
    cbActiveCenter: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cbAnimateClick(Sender: TObject);
    procedure cbActiveCenterClick(Sender: TObject);
  private
    Increment1,Increment2: Double;
    Series1,Series2: TKnobGauge;
    NumericGauge1,NumericGauge2: TNumericGauge;

    procedure AfterDrawValues1(Sender: TObject);
    procedure AfterDrawValues2(Sender: TObject);

    function CalcNGaugeBounds1: TRect;
    function CalcNGaugeBounds2: TRect;
    procedure DrawNGauge1;
    procedure DrawNGauge2;
    procedure SetUpNGauge1;
    procedure SetUpNGauge2;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Math;

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TKnobGauge_SeriesForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D:=false;
  Chart1.Legend.Visible:=false;
  Chart1.Title.Font.Color:=RGB(255,255,255);
  Chart1.Title.Caption:='KnobGauge';

  Series1:=TKnobGauge(CreateNewSeries(Self,Chart1,TKnobGauge));
  Series1.Value:=1;
  Series1.TotalAngle:=280;
  Series1.AfterDrawValues:=AfterDrawValues1;

  Series2:=TKnobGauge(CreateNewSeries(Self,Chart1,TKnobGauge));
  Series2.Value:=99;
  Series2.TotalAngle:=280;
  Series2.AfterDrawValues:=AfterDrawValues2;

  SetUpNGauge1;
  SetUpNGauge2;

  Increment1:=0.1;
  Increment2:=0.1;
  Timer1.Interval:=50;
  Timer2.Interval:=100;
  Timer1.Enabled:=True;
  Timer2.Enabled:=True;
end;

procedure TKnobGauge_SeriesForm.SetUpNGauge1;
var Axis: TChartAxis;
begin
  Axis:=TChartAxis.Create(Chart1);
  Axis.Horizontal:=True;
  NumericGauge1:=TNumericGauge(CreateNewSeries(Self,Chart1,TNumericGauge));
  NumericGauge1.HorizAxis:=aCustomHorizAxis;
  NumericGauge1.Embedded:=True;
  NumericGauge1.CustomHorizAxis:=Axis;
  NumericGauge1.TextMarker.Active:=False;
  NumericGauge1.UnitsMarker.Active:=False;
  NumericGauge1.ValueFormat:='###.0';
  NumericGauge1.ValueMarker.Shape.Font.Size:=12;
end;

procedure TKnobGauge_SeriesForm.SetUpNGauge2;
var Axis: TChartAxis;
begin
  Axis:=TChartAxis.Create(Chart1);
  Axis.Horizontal:=True;
  NumericGauge2:=TNumericGauge(CreateNewSeries(Self,Chart1,TNumericGauge));
  NumericGauge2.HorizAxis:=aCustomHorizAxis;
  NumericGauge2.Embedded:=True;
  NumericGauge2.CustomHorizAxis:=Axis;
  NumericGauge2.TextMarker.Active:=False;
  NumericGauge2.UnitsMarker.Active:=False;
  NumericGauge2.ValueFormat:='###.0';
  NumericGauge2.ValueMarker.Shape.Font.Size:=12;
end;

function TKnobGauge_SeriesForm.CalcNGaugeBounds1: TRect;
begin
  Result:=TeeRect(Series1.CircleXCenter - 30,
                  Series1.CircleYCenter + Series1.YRadius + 10,
                  Series1.CircleXCenter + 30,
                  Series1.CircleYCenter + Series1.YRadius + 50);
end;

function TKnobGauge_SeriesForm.CalcNGaugeBounds2: TRect;
begin
  Result:=TeeRect(Series2.CircleXCenter - 30,
                  Series2.CircleYCenter + Series2.YRadius + 10,
                  Series2.CircleXCenter + 30,
                  Series2.CircleYCenter + Series2.YRadius + 50);
end;

procedure TKnobGauge_SeriesForm.DrawNGauge1;
begin
  NumericGauge1.CustomBounds:=CalcNGaugeBounds1;
  NumericGauge1.Value:=Series1.Value;
end;

procedure TKnobGauge_SeriesForm.DrawNGauge2;
begin
  NumericGauge2.CustomBounds:=CalcNGaugeBounds2;
  NumericGauge2.Value:=Series2.Value;
end;

procedure TKnobGauge_SeriesForm.AfterDrawValues1(Sender: TObject);
begin
  DrawNGauge1;
end;

procedure TKnobGauge_SeriesForm.AfterDrawValues2(Sender: TObject);
begin
  DrawNGauge2;
end;

procedure TKnobGauge_SeriesForm.Timer1Timer(Sender: TObject);
begin
  if (Series1.Value>=100) then Increment1:=-0.1;
  if (Series1.Value<=0) then Increment1:=0.1;

  Series1.Value:=Series1.Value+Increment1;
end;

procedure TKnobGauge_SeriesForm.Timer2Timer(Sender: TObject);
begin
  if (Series2.Value>=100) then Increment2:=-0.1;
  if (Series2.Value<=0) then Increment2:=0.1;

  Series2.Value:=Series2.Value+Increment2;
end;

procedure TKnobGauge_SeriesForm.cbAnimateClick(Sender: TObject);
begin
  Timer1.Enabled:=cbAnimate.Checked;
  Timer2.Enabled:=cbAnimate.Checked;
  if cbAnimate.Checked then cbActiveCenter.Checked:=False;
  cbActiveCenter.Enabled:=not cbAnimate.Checked;
end;

procedure TKnobGauge_SeriesForm.cbActiveCenterClick(Sender: TObject);
begin
  Series1.ActiveCenter:=cbActiveCenter.Checked;
  Series2.ActiveCenter:=cbActiveCenter.Checked;
end;

initialization
  RegisterClass(TKnobGauge_SeriesForm);
end.
