unit Function_MovAve;
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
  Base, TeCanvas, TeeProcs, TeEngine, Chart, StatChar, CurvFitt, Series,
  TeeGDIPlus;

type
  TMovAveFunctionForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Edit3: TEdit;
    UpDown3: TUpDown;
    ExpAve1: TLineSeries;
    MovingAve1: TLineSeries;
    MovingAve2: TLineSeries;
    Curve1: TLineSeries;
    Timer1: TTimer;
    PriceLine: TLineSeries;
    ExpAverageFunction1 : TExpAverageFunction;
    MovingAverageFunction1: TMovingAverageFunction;
    MovingAverageFunction2: TMovingAverageFunction;
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
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

procedure TMovAveFunctionForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked; { <-- animation on / off }
end;

procedure TMovAveFunctionForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  With PriceLine do
  Begin
    Delete(0); { <-- remove the first point }

    { If the MovingAverage RecalcOptions property contains the [rOnDelete]
      recalc option (the default), then the MovingAverages will be
      cleared and recalculated automatically.

      But, if not (speed improvement), we should manually remove the
      first MovingAverage point and force recalculation.
    }
    if not (rOnDelete in MovingAve1.RecalcOptions) then
       MovingAve1.Delete(0);
    if not (rOnDelete in MovingAve2.RecalcOptions) then
       MovingAve2.Delete(0);

    { Add a new random point }
    AddXY( XValues.Last+1,
           YValues.Last+(Random(ChartSamplesMax)-(ChartSamplesMax/2)),
           '',clTeeColor);

    { Recalculate Averages }
    RefreshSeries;
  end;
  Timer1.Enabled:=True;
end;

procedure TMovAveFunctionForm.Edit2Change(Sender: TObject);
begin
  MovingAve1.FunctionType.Period:=UpDown2.Position;
end;

procedure TMovAveFunctionForm.Edit3Change(Sender: TObject);
begin
  MovingAve2.FunctionType.Period:=UpDown3.Position;
end;

procedure TMovAveFunctionForm.Edit1Change(Sender: TObject);
begin
  ExpAverageFunction1.Weight:=(UpDown1.Position/100.0); { <-- change exponential weight }
end;

procedure TMovAveFunctionForm.CheckBox3Click(Sender: TObject);
begin
  { switch between 2D and 3D and start animating... }
  With Chart1 do
  begin
    View3D:=CheckBox3.Checked;
    Axes.Visible:=not View3D;
    View3dWalls:=not View3D;
    Chart3dPercent:=20;
    ClipPoints:=not View3D;
    Frame.Visible:=not View3D;
    Title.Visible:=not View3D;
    Foot.Visible:=not View3D;
    Gradient.Visible:=View3D;
    if View3D then
       Legend.Alignment:=laBottom
    else
       Legend.Alignment:=laLeft;
    UndoZoom;
  end;

  if CheckBox3.Checked then CheckBox1.Checked:=True;
end;

procedure TMovAveFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;

  { tell the moving averages not to recalculate when
    we will delete points... }
  With MovingAve1 do RecalcOptions:=RecalcOptions-[rOnDelete];
  With MovingAve2 do RecalcOptions:=RecalcOptions-[rOnDelete];

  PriceLine.FillSampleValues(200); { <-- Some random points }
end;

initialization
  RegisterClass(TMovAveFunctionForm);
end.
