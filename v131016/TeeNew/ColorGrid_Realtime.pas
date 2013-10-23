unit ColorGrid_Realtime;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart;

type
  TColorGridRealtime = class(TBaseForm)
    ColorGrid: TColorGridSeries;
    CheckBox5: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox6: TCheckBox;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateTheChart;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.XFM}
{$ENDIF}

{$IFNDEF CLR}
type
  TListHack=class(TChartValueList);
{$ENDIF}

Const DemoPoints=200;

var x : Integer=-1;

procedure TColorGridRealtime.UpdateTheChart;
var y,z   : integer;
    Index : Integer;
begin
  Index:=ColorGrid.Count;

  ColorGrid.BeginUpdate;
  try
    Inc(x);

    for z := 0 to DemoPoints-1 do
    begin
      y := Random(100);
      ColorGrid.AddXYZ(x,y,z ,'',Random($FFFFFF));
    end;

    // BEGIN SPEED OPTIMIZATIONS

    {$IFNDEF CLR}
    TListHack(ColorGrid.XValues).RecalcStats(Index);
    TListHack(ColorGrid.YValues).RecalcStats(Index);
    TListHack(ColorGrid.ZValues).RecalcStats(Index);
    {$ENDIF}

    if ColorGrid.ReuseGridIndex then
       ColorGrid.FillGridIndex(Index);
    // END SPEED OPTIMIZATIONS

    ColorGrid.Repaint;
  finally
    ColorGrid.EndUpdate;
  end;
end;

procedure TColorGridRealtime.Timer1Timer(Sender: TObject);
begin
  UpdateTheChart;
  Label1.Caption:='Size: '+IntToStr(ColorGrid.NumXValues)+' x '+IntToStr(ColorGrid.NumZValues);
end;

procedure TColorGridRealtime.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ColorGrid.Clear;
    ColorGrid.NumXValues:=0;
    ColorGrid.NumZValues:=0;
    x:=-1;
  end;

  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TColorGridRealtime.FormCreate(Sender: TObject);
begin
  inherited;

  Timer1.Enabled:=False;
  Timer1.Interval:=1;

  // Remove chart parts to improve drawing speed
  Chart1.Legend.Hide;
  Chart1.ClipPoints:=False;
  Chart1.Title.Hide;
  Chart1.Axes.Left.Grid.Hide;
  Chart1.Axes.Bottom.Grid.Hide;
  ColorGrid.Pen.Hide;

  // Speed tricks:
  ColorGrid.ReuseGridIndex:=True;
  Chart1.Axes.FastCalc:=True;
end;

procedure TColorGridRealtime.CheckBox5Click(Sender: TObject);
begin
  ColorGrid.SmoothBitmap:=CheckBox5.Checked;
end;

procedure TColorGridRealtime.CheckBox6Click(Sender: TObject);
begin
  ColorGrid.ReuseGridIndex:=CheckBox6.Checked;
end;

initialization
  RegisterClass(TColorGridRealtime);
end.
