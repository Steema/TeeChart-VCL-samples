unit SeriesType_Surface;
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
  Base, TeCanvas, TeeProcs, TeEngine, Chart, TeeSurfa, TeeTools;

type
  TSurfaceSeriesForm = class(TBaseForm)
    Animation1: TCheckBox;
    CBColorMode: TComboBox;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    SurfaceSeries1: TSurfaceSeries;
    ChartTool1: TRotateTool;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    function SurfaceSeries1GetYValue(Sender: TChartSeries; X,
      Z: Integer): Double;
    procedure Edit1Change(Sender: TObject);
    procedure Animation1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CBColorModeChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

procedure TSurfaceSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  SurfaceSeries1.FillSampleValues(30);

  // Optional settings to accelerate display:
  Chart1.Axes.FastCalc:=True;
  SurfaceSeries1.FastBrush:=True;

  // Optional setting to improve display on rotation,
  // but slowing performance:
  SurfaceSeries1.HideCells:=True;
end;

function TSurfaceSeriesForm.SurfaceSeries1GetYValue(Sender: TChartSeries;
  X, Z: Integer): Double;
var PiPortion,
    HalfPi,
    tmpx,
    tmpz    : Double;
begin
  result:=0;

  With SurfaceSeries1 do
  begin
    PiPortion:=Pi/(NumXValues);
    HalfPi:=Pi*0.5;
    tmpX:=x*PiPortion;
    tmpZ:=z*PiPortion;

    // sample surfaces...
    Case UpDown1.Position of
      1: result:=0.5*sqr(Cos(x/(NumXValues*0.2)))+
                     sqr(Cos(z/(NumXValues*0.2)))-
                     cos(z/(NumXValues*0.5));
      2: result:= sqr( Cos(tmpx) ) * sqr( Sin(tmpz) );
      3: result:= cos(tmpx*tmpx)+sin(tmpz*tmpz);
      4: result:= sqr(cos(tmpx))+sqr(sin(tmpz));
      5: result:= -tmpx+sqr(tmpz)*sin(tmpx*tmpz);
      6: result:= Sqrt(tmpx * tmpx + tmpz * tmpz);
      7: result:= cos(abs(tmpx-HalfPi))*sin(tmpz);
      8: result:= cos(abs(tmpx-HalfPi)*abs(tmpz-HalfPi));
    end;
  end;
end;

procedure TSurfaceSeriesForm.Edit1Change(Sender: TObject);
begin
  SurfaceSeries1.ReCreateValues;
end;

procedure TSurfaceSeriesForm.Animation1Click(Sender: TObject);
begin
  Randomize;
  Timer1.Enabled:=Animation1.Checked;  { start / stop timer }
end;

procedure TSurfaceSeriesForm.Timer1Timer(Sender: TObject);

  Function RandomColor:TColor;
  begin { get a random color }
    result:=GetDefaultColor(Random(High(TeeColorPalette)));
  end;

begin
  Timer1.Enabled:=False;  { stop animation timer }

  { Invert Left axis randomly }
  if Random(100)<2 then
     Chart1.LeftAxis.Inverted:=not Chart1.LeftAxis.Inverted;

  { Invert Bottom axis randomly }
  if Random(100)<2 then
     Chart1.BottomAxis.Inverted:=not Chart1.BottomAxis.Inverted;

  { Invert Depth axis randomly }
  if Random(100)<2 then
     Chart1.DepthAxis.Inverted:=not Chart1.DepthAxis.Inverted;

  { Change Color Mode (Single, Range, Palette or Grayscale) randomly }
  if Random(100)<2 then
  begin
    if CBColorMode.ItemIndex<CBColorMode.Items.Count-1 then
       CBColorMode.ItemIndex:=CBColorMode.ItemIndex+1
    else
       CBColorMode.ItemIndex:=0;
    CBColorModeChange(Self);
  end;

  { Change Chart Gradient Colors randomly (only at 16k colors or greater) }
  if Random(100)<10 then Chart1.Gradient.StartColor:=RandomColor else
  if Random(100)<10 then Chart1.Gradient.EndColor:=RandomColor;

  { Change Chart Gradient direction randomly }
  if Random(100)<5 then
     Chart1.Gradient.Direction:=TGradientDirection(Random(Ord(High(TGradientDirection))));

  { Random change Surface and Chart colors }
  With SurfaceSeries1 do
  Begin
    Case CBColorMode.ItemIndex of
      0: if Random(100)<15 then SeriesColor:=RandomColor; { single color }
      1: begin { color range }
           if Random(100)<15 then
              StartColor:=RandomColor
           else
           if Random(100)<15 then
              EndColor:=RandomColor;
         end;
    end;

    { random change pen color }
    if Random(100)<15 then Pen.Color:=RandomColor;
  end;

  { Change Surface Example: }
  With UpDown1 do if Position<Max then Position:=Position+1
                                  else Position:=Min;
  Timer1.Enabled:=True;  { re-start animation timer }
end;

procedure TSurfaceSeriesForm.CBColorModeChange(Sender: TObject);
begin
  Case CBColorMode.ItemIndex of
    0: Begin
         SurfaceSeries1.UseColorRange:=False;
         SurfaceSeries1.UsePalette:=False;
       end;
    1:  Begin
         SurfaceSeries1.UseColorRange:=True;
         SurfaceSeries1.UsePalette:=False;
       end;
    2: Begin
         SurfaceSeries1.UseColorRange:=False;
         SurfaceSeries1.UsePalette:=True;
         SurfaceSeries1.PaletteStyle:=psPale;
       end;
    3: begin
         SurfaceSeries1.UseColorRange:=False;
         SurfaceSeries1.UsePalette:=True;
         SurfaceSeries1.PaletteStyle:=psStrong;
       end;
    4: begin
         SurfaceSeries1.UseColorRange:=False;
         SurfaceSeries1.UsePalette:=True;
         SurfaceSeries1.PaletteStyle:=psGrayscale;
       end;
    5: begin
         SurfaceSeries1.UseColorRange:=False;
         SurfaceSeries1.UsePalette:=True;
         SurfaceSeries1.PaletteStyle:=psInvGray;
       end;
    6: begin
         SurfaceSeries1.UseColorRange:=False;
         SurfaceSeries1.UsePalette:=True;
         SurfaceSeries1.PaletteStyle:=psRainbow;
       end;
  end;
end;

procedure TSurfaceSeriesForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: begin
         SurfaceSeries1.WireFrame:=False;
         SurfaceSeries1.DotFrame:=False;
         SurfaceSeries1.Pen.Visible:=True;
       end;
    1: begin
         SurfaceSeries1.WireFrame:=False;
         SurfaceSeries1.DotFrame:=False;
         SurfaceSeries1.Pen.Visible:=False;
       end;
    2: begin
         SurfaceSeries1.WireFrame:=True;
         SurfaceSeries1.Pen.Visible:=True;
       end;
    3: begin
         SurfaceSeries1.DotFrame:=True;
       end;
  end;
end;

procedure TSurfaceSeriesForm.FormShow(Sender: TObject);
begin
  inherited;
  CBColorMode.ItemIndex:=3;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TSurfaceSeriesForm);
end.
