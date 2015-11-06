unit Tool_LegendPalette;
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
  jpeg,
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeSurfa,
  TeeLegendPalette, TeeGDIPlus;

type
  TLegendPaletteToolForm = class(TBaseForm)
    Series1: TSurfaceSeries;
    cbVertical: TCheckBox;
    cbPen: TCheckBox;
    Label1: TLabel;
    cbAxis: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Chart1Resize(Sender: TObject);
    procedure cbVerticalClick(Sender: TObject);
    procedure cbPenClick(Sender: TObject);
    procedure cbAxisChange(Sender: TObject);
  private
    { Private declarations }
    LegendPalette : TLegendPaletteTool;
    procedure AddSurfacePoints;
  public
    { Public declarations }
  end;

implementation


{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeCanvas;

procedure TLegendPaletteToolForm.FormCreate(Sender: TObject);
begin
  inherited;

  with Chart1 do
  begin
    Axes.FastCalc:=True;
    View3DOptions.ZoomText:=ztNo;
    MarginRight := 18;
  end;

  AddSurfacePoints;

  // Create tool  (this can also be done at design-time without any code)
  LegendPalette:=TLegendPaletteTool.Create(Self);
  with LegendPalette do
  begin
    Series:=Series1;
    Pen.Visible:=false;
  end;

  Chart1.Tools.Add(LegendPalette);
  cbAxis.ItemIndex:=2;
end;

Procedure TLegendPaletteToolForm.AddSurfacePoints;
const NumX=50;
      NumZ=30;
var x,z : Integer;
begin

  Series1.NumXValues:=NumX;
  Series1.NumZValues:=NumZ;

  for x:=1 to NumX do
      for z:=1 to NumZ do
          Series1.AddXYZ( x,
                          cos(0.14*x)*cos(0.25*z)+
                          0.01*(x-(NumX div 2))*(z-(NumZ div 2)) +
                          13*exp(-0.06*(sqr(x-(NumX div 2))+sqr(z-(NumZ div 2))))+
                          6*exp(-0.03*(sqr(x-(NumX div 3))+sqr(z-3*(NumZ div 5))))-1,
                          z );
end;

procedure TLegendPaletteToolForm.Chart1Resize(Sender: TObject);
begin
  LegendPalette.Left:= Chart1.Width-LegendPalette.Width-10;
end;

procedure TLegendPaletteToolForm.cbVerticalClick(Sender: TObject);
begin
  with LegendPalette do
  begin
    Vertical:=cbVertical.Checked;
    Left:= Chart1.Width-LegendPalette.Width-10
  end;
end;

procedure TLegendPaletteToolForm.cbPenClick(Sender: TObject);
begin
  LegendPalette.Pen.Visible:=cbPen.Checked;
end;

procedure TLegendPaletteToolForm.cbAxisChange(Sender: TObject);
begin
  with LegendPalette do
    case cbAxis.ItemIndex of
      0 : Axis:=laDefault;
      1 : Axis:=laOther;
      2 : Axis:=laBoth;
    end;
end;

initialization
  RegisterClass(TLegendPaletteToolForm);
end.
