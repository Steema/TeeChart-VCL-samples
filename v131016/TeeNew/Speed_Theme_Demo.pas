unit Speed_Theme_Demo;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TSpeedThemeDemo = class(TBaseForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    MaxPoints    : Integer;    // total points per Series
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
  public
    { Public declarations }
  end;

var
  SpeedThemeDemo: TSpeedThemeDemo;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses TeeThemes;

procedure TSpeedThemeDemo.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.ClearChart;

  // Prepare chart for maximum speed:
  with TSpeedTheme.Create(Chart1) do
  try
    Apply;
  finally
    Free;
  end;

  Series1:=TFastLineSeries.Create(Self);
  Series2:=TFastLineSeries.Create(Self);

  Series1.DrawAllPoints:=CheckBox1.Checked;
  Series2.DrawAllPoints:=CheckBox1.Checked;

  Series1.FastPen:=CheckBox2.Checked;
  Series2.FastPen:=CheckBox2.Checked;

  Chart1.AddSeries(Series1);
  Chart1.AddSeries(Series2);

  // Private variables for this demo:
  MaxPoints:=StrToInt(Edit1.Text);

  // Prepare series.
  // Disable AutoRepaint and X Order

  // AutoRepaint=False means "real-time" drawing mode.
  // Points are displayed just after adding them,
  // without redrawing the whole chart.
  Series1.AutoRepaint:=False;
  Series2.AutoRepaint:=False;

  // Set Ordering to none, to increment speed when adding points
  Series1.XValues.Order:=loNone;
  Series2.XValues.Order:=loNone;

  // Initialize axis scales
  Chart1.Axes.Bottom.SetMinMax(1,MaxPoints);

  // Speed tips:

  {$IFNDEF CLX}
  {$IFNDEF CLR}

  // When using only a single thread, disable locking:
  Chart1.Canvas.ReferenceCanvas.Pen.OwnerCriticalSection:=nil;
  Series1.LinePen.OwnerCriticalSection:=nil;
  Series2.LinePen.OwnerCriticalSection:=nil;

  {$ENDIF}
  {$ENDIF}

  // Speed realtime painting with solid pens of width 1.
  Series1.FastPen:=True;
  Series2.FastPen:=True;
end;

// This button adds points to Series1 and Series2.
procedure TSpeedThemeDemo.BitBtn1Click(Sender: TObject);

  //Adds one million points array directly to Series ValueLists
  Procedure ArrayAdd(Series: TChartSeries);
  Var X,Y : Array of Double;   // TChartValues
      t   : Integer;
      Num : Integer;
  begin
    { 1M points }
    Num:=MaxPoints;

    { allocate our custom arrays }
    SetLength(X,Num);
    SetLength(Y,Num);

    { fill data in our custom arrays }
    X[0]:=0;
    Y[0]:=Random(10000);
    for t:=1 to Num-1 do
    begin
      X[t]:=t;
      Y[t]:=Y[t-1]+Random(101)-50;
    end;

    { set our X array }
    With Series.XValues do
    begin
      Value:=TChartValues(X);  { <-- the array }
      Count:=Num;               { <-- number of points }
      Modified:=True;           { <-- recalculate min and max }
    end;

    { set our Y array }
    With Series.YValues do
    begin
      Value:=TChartValues(Y);
      Count:=Num;
      Modified:=True;
    end;

    { Show data }
    Series.Repaint;
  end;

begin
  Chart1.Axes.Bottom.SetMinMax(0,MaxPoints);

  ArrayAdd(Series1);
  ArrayAdd(Series2);
end;

procedure TSpeedThemeDemo.CheckBox1Click(Sender: TObject);
begin
  Series1.DrawAllPoints:=CheckBox1.Checked;
  Series2.DrawAllPoints:=CheckBox1.Checked;
end;

procedure TSpeedThemeDemo.CheckBox2Click(Sender: TObject);
begin
  // When FastLine series have AutoRepaint = False ,
  // setting FastPen to True increases speed.
  Series1.FastPen:=CheckBox2.Checked;
  Series2.FastPen:=CheckBox2.Checked;
end;

procedure TSpeedThemeDemo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=caFree;
end;

procedure TSpeedThemeDemo.Edit1Change(Sender: TObject);
begin
  inherited;
  MaxPoints:=StrToInt(Edit1.Text);
end;

initialization
  RegisterClass(TSpeedThemeDemo);
end.
