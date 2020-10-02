unit Surface_Smoothing;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeTools, TeeOpenGL,
  TeeGDIPlus;

type
  TSurfaceSmoothing = class(TBaseForm)
    Series1: TSurfaceSeries;
    Button1: TButton;
    ChartTool1: TRotateTool;
    Label1: TLabel;
    TeeOpenGL1: TTeeOpenGL;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeSmoothGrid3D;

procedure TSurfaceSmoothing.Button1Click(Sender: TObject);
begin
  // Smooth the surface !

  SmoothGrid3D(Series1);

  // Now re-calculate NumX and NumX to display at Label1.Caption
  Series1.FillGridIndex;

  // For more speed, set reuse
  if CheckBox2.Checked then
     Series1.ReuseGridIndex:=True;

  // Display new grid size at Label1
  Label1.Caption:='Grid size = '+
                        IntToStr(Series1.NumXValues)+' x '+
                        IntToStr(Series1.NumZValues);
end;

procedure TSurfaceSmoothing.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D := True;

  // Create a Surface with a small number of cells:
  Series1.FillSampleValues(5);   // 5 x 5 surface grid

  // Remove surface grid lines (they disturb when the surface has lots of cells)
  Series1.Pen.Hide;

  // Some speed tricks:
  Chart1.Axes.FastCalc:=True;  // speed trick
  Series1.FastBrush:=True; // speed trick (XP,2000 and 2003 only)
end;

procedure TSurfaceSmoothing.CheckBox1Click(Sender: TObject);
begin
  TeeOpenGL1.Active:=CheckBox1.Checked
end;

procedure TSurfaceSmoothing.CheckBox2Click(Sender: TObject);
begin
  // For more speed, lets disable items:

  Chart1.AxisVisible:=not CheckBox2.Checked;
  Chart1.Legend.Visible:=not CheckBox2.Checked;
  Chart1.Title.Visible:=not CheckBox2.Checked;

  if CheckBox2.Checked then
     Chart1.BevelOuter:=bvNone
  else
     Chart1.BevelOuter:=bvRaised;

  Chart1.ClipPoints:=not CheckBox2.Checked;

  Chart1.Walls.Bottom.Transparent:=CheckBox2.Checked;

  if CheckBox2.Checked then
     Chart1.Walls.Size:=0
  else
     Chart1.Walls.Size:=5;

  // Speed trick, as we know Surface data will not be modified anymore:
  Series1.ReuseGridIndex:=CheckBox2.Checked;

  // "Palette" color mode is faster than "Range" 
  Series1.UsePalette:=CheckBox2.Checked;
  Series1.UseColorRange:=not CheckBox2.Checked;
end;

initialization
  RegisterClass(TSurfaceSmoothing);
end.
