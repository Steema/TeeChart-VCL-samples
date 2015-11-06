unit FastLine_Realtime;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeGDIPlus;

type
  TFastDeleteRealtime = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Stopped      : Boolean;    // are we in "loop" mode ?
    MaxPoints    : Integer;    // total points per Series
    ScrollPoints : Integer;    // number of points to scroll when filled
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFastDeleteRealtime.FormCreate(Sender: TObject);
begin
  inherited;

  // Prepare chart for maximum speed:

  with Chart1 do
  begin
    ClipPoints:=False;
    Title.Visible:=False;
    Legend.Visible:=False;
    LeftAxis.Axis.Width:=1;
    BottomAxis.Axis.Width:=1;
    BottomAxis.RoundFirstLabel:= False;
    View3D:=False;
  end;

  // Private variables for this demo:
  Stopped:=True;
  MaxPoints:=10000;
  ScrollPoints:=5000;

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
  Chart1.LeftAxis.Automatic:=True;
  Chart1.BottomAxis.SetMinMax(1,MaxPoints);

  // Speed tips:

  {$IFNDEF CLX}

  // When using only a single thread, disable locking:
  Chart1.Canvas.ReferenceCanvas.Pen.OwnerCriticalSection:=nil;
  Series1.LinePen.OwnerCriticalSection:=nil;
  Series2.LinePen.OwnerCriticalSection:=nil;

  {$ENDIF}

  // For Windows NT, 2000 and XP only:
  // Speed realtime painting with solid pens of width 1.
  Series1.FastPen:=True;
  Series2.FastPen:=True;

  // Set axis calculations in "fast mode".
  // Note: For Windows Me and 98 might produce bad drawings when
  //       chart zoom is very big.
  Chart1.Axes.FastCalc:=True;
end;

// This button starts / stops a fast loop to add points
// to Series1 and Series2.
procedure TFastDeleteRealtime.BitBtn1Click(Sender: TObject);

  // Adds a new random point to Series
  Procedure RealTimeAdd(Series:TChartSeries);
  begin
    if Series.Count=0 then  // First random point
       Series.AddXY(1,Random(10000))
    else
       // Next random point
       Series.AddXY(Series.XValues.Last+1,Series.YValues.Last+Random(10)-4.5);
  end;

  // When the chart is filled with points, this procedure
  // deletes and scrolls points to the left.
  Procedure DoScrollPoints;
  var tmp,tmpMin,tmpMax : Double;
  begin
    // Delete multiple points with a single call.
    // Much faster than deleting points using a loop.

    Series1.Delete(0,ScrollPoints);
    Series2.Delete(0,ScrollPoints);

    // Scroll horizontal bottom axis
    tmp:=Series1.XValues.Last;
    Chart1.BottomAxis.SetMinMax(tmp-MaxPoints+ScrollPoints,tmp+ScrollPoints);

    // Scroll vertical left axis
    tmpMin:=Series1.YValues.MinValue;
    if Series2.YValues.MinValue<tmpMin then tmpMin:=Series2.YValues.MinValue;

    tmpMax:=Series1.YValues.MaxValue;
    if Series2.YValues.MaxValue>tmpMax then tmpMax:=Series2.YValues.MaxValue;

    with Chart1.LeftAxis do
    if not Automatic then
       SetMinMax(tmpMin-tmpMin/5,tmpMax+tmpMax/5);

    // Do chart repaint after deleting and scrolling
    Application.ProcessMessages;
  end;

begin
  if Stopped then
  begin
    // Start loop...
    BitBtn1.Caption:='&Stop';
    Edit1.Enabled:=False;
    Edit2.Enabled:=False;

    // Prepare variables
    MaxPoints:=StrToInt(Edit1.Text);
    ScrollPoints:=StrToInt(Edit2.Text);
    Chart1.BottomAxis.SetMinMax(1,MaxPoints);

    // Clear
    Series1.Clear;
    Series2.Clear;
    Application.ProcessMessages;

    Stopped:=False;

    // Start loop
    while not Stopped do
    begin
      // Add one more point
      RealTimeAdd(Series1);
      RealTimeAdd(Series2);

      // Delete and Scroll points to the left
      if Series1.Count>Pred(MaxPoints) then
         DoScrollPoints;
    end;
  end
  else
  begin
    // Finish
    Stopped:=True;
    BitBtn1.Caption:='&Start';
    Edit1.Enabled:=True;
    Edit2.Enabled:=True;
  end;
end;

procedure TFastDeleteRealtime.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Stopped:=True;  // Break loop to allow close form
end;

procedure TFastDeleteRealtime.CheckBox1Click(Sender: TObject);
begin
  Series1.DrawAllPoints:=CheckBox1.Checked;
  Series2.DrawAllPoints:=CheckBox1.Checked;
end;

procedure TFastDeleteRealtime.CheckBox2Click(Sender: TObject);
begin
  // When FastLine series have AutoRepaint = False ,
  // setting FastPen to True increases speed.
  Series1.FastPen:=CheckBox2.Checked;
  Series2.FastPen:=CheckBox2.Checked;
end;

procedure TFastDeleteRealtime.FormDestroy(Sender: TObject);
begin
  Stopped:=True;  // Break loop to allow close form
  inherited;
end;

procedure TFastDeleteRealtime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=caFree;
end;

initialization
  RegisterClass(TFastDeleteRealtime);
end.
