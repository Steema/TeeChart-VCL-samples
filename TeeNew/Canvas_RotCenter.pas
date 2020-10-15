unit Canvas_RotCenter;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls, QActnList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, ActnList,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeSurfa, TeeChartActions, TeeTools,
  TeeLegendPalette, TeeGDIPlus;

type
  TRotationCenter = class(TBaseForm)
    Series1: TSurfaceSeries;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    Label3: TLabel;
    TrackBar2: TTrackBar;
    Label4: TLabel;
    TrackBar3: TTrackBar;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ActionList1: TActionList;
    SeriesActionActive1: TSeriesActionActive;
    ChartTool1: TRotateTool;
    procedure TrackBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
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

Uses TeCanvas;

procedure TRotationCenter.TrackBar1Change(Sender: TObject);
begin
  Chart1.Canvas.RotationCenter.X:=TrackBar1.Position;
end;

procedure TRotationCenter.Timer1Timer(Sender: TObject);
begin
  inherited;

  With Chart1.View3DOptions do
       Rotation:=(Rotation+1) mod 360;
end;

procedure TRotationCenter.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  Series1.HideCells:=True;
end;

procedure TRotationCenter.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Timer1.Enabled:=CheckBox1.Checked
end;

procedure TRotationCenter.TrackBar2Change(Sender: TObject);
begin
  Chart1.Canvas.RotationCenter.Y:=TrackBar2.Position;
end;

procedure TRotationCenter.TrackBar3Change(Sender: TObject);
begin
  Chart1.Canvas.RotationCenter.Z:=TrackBar3.Position;
end;

procedure TRotationCenter.Chart1AfterDraw(Sender: TObject);
var tmpX : Integer;
    tmpY : Integer;
    tmpZ : Integer;
begin
  inherited;

  if CheckBox2.Checked then { draw 3D axes }
  With Chart1,Canvas do
  begin
    { set pen style }
    Pen.Color:=clBlue;
    Pen.Width:=1;
    Pen.Style:=psDot;

    { center position }
    tmpY:=ChartYCenter+Round(RotationCenter.Y);
    tmpX:=ChartXCenter+Round(RotationCenter.X);
    tmpZ:=(Width3D div 2)+Round(RotationCenter.Z);

    { draw axes }
    HorizLine3D( ChartRect.Left,ChartRect.Right,tmpY,tmpZ);
    VertLine3D( tmpX, ChartRect.Top, ChartRect.Bottom, tmpZ);
    ZLine3D( tmpX, tmpY, 0, Width3D);
  end;
end;

initialization
  RegisterClass(TRotationCenter);
end.
