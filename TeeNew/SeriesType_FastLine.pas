unit SeriesType_FastLine;
{$I TeeDefs.inc}

interface

uses
  {$IFDEF LINUX}
  LibC,
  {$ELSE}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeeGDIPlus;

type
  TFastLineForm = class(TBaseForm)
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button1: TButton;
    TeeGDIPlus1: TTeeGDIPlus;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TFastLineForm.FormCreate(Sender: TObject);
var t,tmpRandom : Integer;
begin
  inherited;

  // These properties (DrawStyle and FastPen) increase the speed of
  // FastLine series:

  // Draw all points using a single Canvas Polyline:
  FastLineSeries1.DrawStyle:=flAll;
  FastLineSeries2.DrawStyle:=flAll;

  // Use Windows GDI / GDI+ stock pen to accelerate a little bit:
  FastLineSeries1.FastPen:=True;
  FastLineSeries2.FastPen:=True;

  // Avoid flickering when repainting the chart (this is the default)
  Chart1.BufferedDisplay:=True;

  Chart1.Axes.Visible:=True;
  Chart1.ClipPoints:=True;

  Chart1.Gradient.Visible := False;

  { hide things for better speed }
  Chart1.View3d:=False;
  Chart1.Legend.Visible:=False;
  Chart1.Title.Visible:=False;
  Chart1.Foot.Visible:=False;

  // Some speed improvement when pre-allocating space for data arrays:
  TeeDefaultCapacity:=10000;

  // Add 10000 random points to each series
  Randomize;

  for t:=1 to 10000 do
  begin
    tmpRandom:=Random(Abs(5000-t))-(Abs(5000-t) div 2);

    FastLineSeries1.Add(10000-t+tmpRandom);
    FastLineSeries2.Add(t+tmpRandom);
  end;

  // Set axis calculations in "fast mode" (assembler in x86 cpu 32bit only)
  Chart1.Axes.FastCalc:=True;
end;

procedure TFastLineForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.BufferedDisplay:=CheckBox1.Checked;
end;

procedure TFastLineForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox2.Checked;
end;

procedure TFastLineForm.CheckBox3Click(Sender: TObject);
begin
  Chart1.ClipPoints:=CheckBox3.Checked;
end;

procedure TFastLineForm.Button1Click(Sender: TObject);
var t1,t2:Single;
    t:Integer;
begin
  Screen.Cursor:=crHourGlass;
  try
    Chart1.AnimatedZoom:=False;

    t1:=TeeTickCount;

    for t:=1 to 30 do Chart1.ZoomPercent(105);  { 5% zoom in }
    for t:=1 to 30 do Chart1.ZoomPercent(95); { 5% zoom out }

    t2:=TeeTickCount;

    Chart1.AnimatedZoom:=True;
    Chart1.UndoZoom;
  finally
    Screen.Cursor:=crDefault;
  end;

  ShowMessage('Time to plot 20000 points'+#13+
              '60 times: '+#13+
              FloatToStr(t2-t1)+' milliseconds.');
end;

initialization
  RegisterClass(TFastLineForm);
end.
