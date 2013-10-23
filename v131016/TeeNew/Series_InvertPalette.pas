unit Series_InvertPalette;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, TeeSurfa, TeeTools,
  TeeGriEd;

type
  TSeriesInvertPalette = class(TBaseForm)
    bInvert: TBitBtn;
    Series1: TIsoSurfaceSeries;
    Label1: TLabel;
    CBPalette: TComboFlat;
    Label3: TLabel;
    sbTransp: TScrollBar;
    Label4: TLabel;
    sbSteps: TScrollBar;
    ChartTool1: TRotateTool;
    function Series1GetYValue(Sender: TChartSeries; X, Z: Integer): Double;
    procedure FormCreate(Sender: TObject);
    procedure bInvertClick(Sender: TObject);
    procedure CBPaletteChange(Sender: TObject);
    procedure sbStepsChange(Sender: TObject);
    procedure sbTranspChange(Sender: TObject);
  private
    { Private declarations }
    Procedure SetPalette;    
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

function TSeriesInvertPalette.Series1GetYValue(Sender: TChartSeries; X,
  Z: Integer): Double;
var PiPortion,
    tmpx,
    tmpz    : Double;
begin

  with Series1 do
  begin
    PiPortion:=Pi/(NumXValues);
    tmpX:=x*PiPortion;
    tmpZ:=z*PiPortion;

    result:=Sqrt(tmpx * tmpx + tmpz * tmpz);
  end;
end;

procedure TSeriesInvertPalette.FormCreate(Sender: TObject);
begin
  inherited;

  ColorPalettes.AddTo(CBPalette.Items);

  CBPalette.ItemIndex:=1;

  with Series1 do
  begin
    FastBrush:=True;
    FillSampleValues(20);
    Pen.Show;
    BandPen.Hide;
    SideLines.Show;
    Sides.Brush.Style:=bsSolid;
  end;

  SetPalette;

  with Chart1 do
  begin
    ClipPoints:=False;
    Axes.FastCalc:=True;
    Legend.Hide;
    Legend.Symbol.DefaultPen:=False;
    Axes.Depth.Visible:=True;
    Axes.Visible:=False;
    Walls.Visible:=False;
  end;
end;

procedure TSeriesInvertPalette.bInvertClick(Sender: TObject);
begin
  Series1.InvertPalette;
end;

Procedure TSeriesInvertPalette.SetPalette;
begin
  case CBPalette.ItemIndex of
    0: begin
         Series1.PaletteStyle:=psPale;
         Series1.CreateDefaultPalette;
       end;
    1: begin
         Series1.PaletteStyle:=psStrong;
         Series1.CreateDefaultPalette;
       end;
    2: begin
         Series1.PaletteStyle:=psGrayScale;
         Series1.CreateDefaultPalette;
       end;
    3: begin
         Series1.PaletteStyle:=psInvGray;
         Series1.CreateDefaultPalette;
       end;
    4: begin
         Series1.PaletteStyle:=psRainbow;
         Series1.CreateDefaultPalette;
       end;
  else
    TGrid3DSeriesEditor.ApplyPalette(Series1,CBPalette.ItemIndex-5);
  end;
end;


procedure TSeriesInvertPalette.CBPaletteChange(Sender: TObject);
begin
  SetPalette;
end;

procedure TSeriesInvertPalette.sbStepsChange(Sender: TObject);
begin
  Series1.PaletteSteps:=SbSteps.Position;
  SetPalette;
end;

procedure TSeriesInvertPalette.sbTranspChange(Sender: TObject);
begin
  Series1.Transparency:=SbTransp.Position;
end;

initialization
  RegisterClass(TSeriesInvertPalette);
end.
