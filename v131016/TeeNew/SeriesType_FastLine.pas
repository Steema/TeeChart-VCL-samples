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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TFastLineForm = class(TBaseForm)
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button1: TButton;
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

  // Avoid flickering when repainting the chart (default)
  Chart1.BufferedDisplay:=True;

  Chart1.Axes.Visible:=True;
  Chart1.ClipPoints:=True;

  { hide things for better speed }
  Chart1.View3d:=False;
  Chart1.Legend.Visible:=False;
  Chart1.Title.Visible:=False;
  Chart1.Foot.Visible:=False;

  { some speed improvement if... }
  TeeDefaultCapacity:=1000;

  { 1000 random points each series }
  Randomize;
  for t:=1 to 1000 do
  begin
    tmpRandom:=Random(Abs(500-t))-(Abs(500-t) div 2);
    FastLineSeries1.Add(1000-t+tmpRandom,'',clTeeColor);
    FastLineSeries2.Add(t+tmpRandom,'',clTeeColor);
  end;

  // Set axis calculations in "fast mode".
  // Note: For Windows Me and 98 might produce bad drawings when
  //       chart zoom is very big.
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
var t1,t2,t:Integer;
begin
  Screen.Cursor:=crHourGlass;
  try
    Chart1.AnimatedZoom:=False;

    t1:={$IFDEF LINUX}Clock{$ELSE}GetTickCount{$ENDIF};
    for t:=1 to 30 do Chart1.ZoomPercent(105);  { 5% zoom in }
    for t:=1 to 30 do Chart1.ZoomPercent(95); { 5% zoom out }
    t2:={$IFDEF LINUX}Clock{$ELSE}GetTickCount{$ENDIF};

    Chart1.AnimatedZoom:=True;
    Chart1.UndoZoom;
  finally
    Screen.Cursor:=crDefault;
  end;
  ShowMessage('Time to plot 2000 points'+#13+
              '61 times: '+#13+
              IntToStr(t2-t1)+' milliseconds.');
end;

initialization
  RegisterClass(TFastLineForm);
end.
