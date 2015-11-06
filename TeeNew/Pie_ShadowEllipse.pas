unit Pie_ShadowEllipse;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF D6}
  Types,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeGDIPlus, TeeTools;

type
  TPieShadowEllipse = class(TBaseForm)
    Series1: TPieSeries;
    ButtonColor1: TButtonColor;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    RadioGroup1: TRadioGroup;
    GridBandTool1: TGridBandTool;
    procedure FormCreate(Sender: TObject);
    procedure Chart1BeforeDrawSeries(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// Draw elliptical shadow on Canvas with starting Color, at R rectangle.
Procedure DrawEllipseShadow(Canvas:TTeeCanvas; Color:TColor; R:TRect);

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.XFM}
{$ENDIF}

uses Math;

// Use the OnBeforeDrawSeries event to display the shadow, otherwise
// the shadow will be displayed on top of the Pie series...
procedure TPieShadowEllipse.Chart1BeforeDrawSeries(Sender: TObject);
var R : TRect;
begin
  if CheckBox1.Checked then  // if we want to display the shadow...
  begin
    // Calculate shadow rectangle based on Chart "ChartRect" space.
    with Chart1.ChartRect do
         R:=Rect(Left+40,Bottom-40,Right-40,Bottom);

    // Draw shadow
    DrawEllipseShadow( Chart1.Canvas, Chart1.Color, R);
  end;
end;

// Draw elliptical shadow on canvas with starting color at R rectangle.
Procedure DrawEllipseShadow(Canvas:TTeeCanvas; Color:TColor; R:TRect);
var t,x,y : Integer;
    Steps : Integer;
    tmpW,
    tmpH  : Double;
begin
  with Canvas do
  begin
    Pen.Style:=psClear;
    Brush.Style:=bsSolid;
    Brush.Color:=Color;

    x:=(R.Left+R.Right) div 2;
    y:=(R.Top+R.Bottom) div 2;

    Steps:=Max( (R.Right-R.Left), (R.Bottom-R.Top));
    tmpW:=0.5*(R.Right-R.Left)/Steps;
    tmpH:=0.5*(R.Bottom-R.Top)/Steps;

    for t:=Steps downto 1 do
    begin
      Brush.Color:=ApplyDark(Color,255-Round(t*255.0/Steps));
      R:=TeeRect(x-Round(t*tmpW),y-Round(t*tmpH),x+Round(t*tmpW),y+Round(t*tmpH));
      Ellipse(R);
    end;
  end;
end;

procedure TPieShadowEllipse.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues;
  ButtonColor1.LinkProperty(Chart1,'Color');

  RadioGroup1.ItemIndex:=1;
end;

procedure TPieShadowEllipse.CheckBox1Click(Sender: TObject);
begin
  Chart1.Invalidate
end;

procedure TPieShadowEllipse.Timer1Timer(Sender: TObject);
begin
  Series1.RotationAngle:=Series1.RotationAngle+1;
end;

procedure TPieShadowEllipse.RadioGroup1Click(Sender: TObject);
begin
  Timer1.Enabled:=RadioGroup1.ItemIndex>0;

  if RadioGroup1.ItemIndex=1 then Timer1.Interval:=200
                             else Timer1.Interval:=1;
end;

initialization
  RegisterClass(TPieShadowEllipse);
end.
