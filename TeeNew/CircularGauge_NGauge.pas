unit CircularGauge_NGauge;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeCircularGauge;

type
  TCircularGaugeNGaugeForm = class(TBaseForm)
    cbSameValue: TCheckBox;
    GroupBox1: TGroupBox;
    Timer1: TTimer;
    Timer2: TTimer;
    cbAutoPosition: TCheckBox;
    Label3: TLabel;
    ETop: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    ELeft: TEdit;
    UpDown2: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbSameValueClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cbAutoPositionClick(Sender: TObject);
    procedure ETopChange(Sender: TObject);
    procedure ELeftChange(Sender: TObject);
  private
    Increment: Double;
    Series1: TCircularGauge;
    { Private declarations }
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

procedure TCircularGaugeNGaugeForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D:=false;
  Chart1.Legend.Visible:=false;
  Chart1.Title.Font.Color:=RGB(255,255,255);
  Chart1.Title.Caption:='Embedded Numeric Gauge';

  Series1:=TCircularGauge.Create(Self);
  Chart1.AddSeries(Series1);
  Series1.NumericGauge.Visible:=true;
  Series1.Value:=1;
  Series1.Axis.LabelsFont.Size:=8;
  Series1.Axis.LabelsFont.Color:=Series1.GetPaletteColor(20);
  Series1.NumericGauge.ValueFormat:='###.0';
  Series1.NumericGauge.ValueMarker.Shape.Font.Size:=14;
  Series1.TotalAngle:=280;
  Series1.GreenLine.Pen.Visible := False;
  Series1.RedLine.Pen.Visible := False;  

  Increment:=0.1;
  Timer1.Interval:=50;
  Timer2.Interval:=500;
  Timer1.Enabled:=True;
  Timer2.Enabled:=False;
end;

procedure TCircularGaugeNGaugeForm.Timer1Timer(Sender: TObject);
begin
  if (Series1.Value>=100) then Increment:=-0.1;
  if (Series1.Value<=0) then Increment:=0.1;

  Series1.Value:=Series1.Value+Increment;
end;

procedure TCircularGaugeNGaugeForm.cbSameValueClick(Sender: TObject);
begin
  Series1.AutoValueNumericGauge:=cbSameValue.Checked;
  Timer2.Enabled:=not cbSameValue.Checked;
end;

procedure TCircularGaugeNGaugeForm.Timer2Timer(Sender: TObject);
begin
  if not Series1.AutoValueNumericGauge then
    Series1.NumericGauge.Value:=Round(Random*100);
end;

procedure TCircularGaugeNGaugeForm.cbAutoPositionClick(Sender: TObject);
begin
  Series1.AutoPositionNumericGauge:=cbAutoPosition.Checked;
  ELeft.Enabled:=not cbAutoPosition.Checked;
  UpDown1.Enabled:=not cbAutoPosition.Checked;
  ETop.Enabled:=not cbAutoPosition.Checked;
  UpDown2.Enabled:=not cbAutoPosition.Checked;

  if not cbAutoPosition.Checked then
  begin
    ETop.Text:=IntToStr(Series1.NumericGauge.CustomBounds.Top);
    ELeft.Text:=IntToStr(Series1.NumericGauge.CustomBounds.Left);
  end
  else
  begin
    ETop.Text:='0';
    ELeft.Text:='0';
  end;
end;

procedure TCircularGaugeNGaugeForm.ETopChange(Sender: TObject);
var tmpR: TRect;
    h: Integer;
begin
  tmpR:=Series1.NumericGauge.CustomBounds;
  h:=tmpR.Bottom-tmpR.Top;
  tmpR.Top:=StrToIntDef(ETop.Text,0);
  tmpR.Bottom:=tmpR.Top+h;
  Series1.NumericGauge.CustomBounds:=tmpR;
end;

procedure TCircularGaugeNGaugeForm.ELeftChange(Sender: TObject);
var tmpR: TRect;
    w: Integer;
begin
  tmpR:=Series1.NumericGauge.CustomBounds;
  w:=tmpR.Right-tmpR.Left;
  tmpR.Left:=StrToIntDef(ELeft.Text,0);
  tmpR.Right:=tmpR.Left+w;
  Series1.NumericGauge.CustomBounds:=tmpR;
end;

initialization
  RegisterClass(TCircularGaugeNGaugeForm);
end.
