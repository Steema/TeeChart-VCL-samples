unit Surface_XYZFloat;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeTools, TeeGDIPlus;

type
  TSurfaceFloatOther = class(TBaseForm)
    Series1: TSurfaceSeries;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
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

procedure TSurfaceFloatOther.FormCreate(Sender: TObject);
var x,z : Integer;
begin
  inherited;

  Chart1.View3D := True;
  Series1.IrregularGrid:=True; { <-- IMPORTANT ! means X and Z are float }

  for x:=1 to 10 do
    for z:=1 to 10 do
      Series1.AddXYZ( x / 10.0, sqrt(x*z), z / 5.0);

  { set palette colors to "10, strong" ... }
  Series1.UseColorRange:=False;
  Series1.UsePalette:=True;
  Series1.PaletteStyle:=psStrong;
  Series1.PaletteSteps:=10;

  { adjust some axes properties... }
  Chart1.DepthAxis.Visible:=True;
  Chart1.DepthAxis.AxisValuesFormat:='0.#';
  Chart1.DepthAxis.Increment:=0.2;

  Chart1.BottomAxis.AxisValuesFormat:='0.#';
  Chart1.BottomAxis.Increment:=0.1;

  { visual properties... }
  Chart1.Chart3DPercent:=100;
  with Chart1.View3DOptions do
  begin
    Orthogonal:=False;
    Perspective:=50;
    Rotation:=327;
    Elevation:=352;
    Zoom:=70;
  end;
end;

initialization
  RegisterClass(TSurfaceFloatOther);
end.

