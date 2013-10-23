unit SeriesType_Polar;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeePolar, TeeEdit, TeeComma;

type
  TPolarForm = class(TForm)
    Chart1: TChart;
    PolarSeries1: TPolarSeries;
    PolarSeries2: TPolarSeries;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    CheckBox2: TCheckBox;
    TeeCommander1: TTeeCommander;
    ChartEditor1: TChartEditor;
    CheckBox3: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure PolarSeries1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
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

procedure TPolarForm.FormCreate(Sender: TObject);
begin
  PolarSeries1.FillSampleValues(20);
  PolarSeries1.Cursor:=crTeeHand;

  PolarSeries2.FillSampleValues(25);
  PolarSeries2.Cursor:=crTeeHand;
end;

procedure TPolarForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TPolarForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;

  { Move Points !!! }
  PolarSeries1.Rotate(5);
  PolarSeries2.Rotate(355);

  {  Change Grid Lines and Horizontal Axis Labels }
  With Chart1.BottomAxis do
  if (Increment=0) or (Increment>=90) then
     Increment:=1
  else
     Increment:=Increment+2;

  {  Change Grid RINGS and Vertical Axis Labels }
  With Chart1.LeftAxis do
  if (Increment=0) or (Increment>=((Maximum-Minimum)/2.0)) then
     Increment:=((Maximum-Minimum)/20.0)
  else
     Increment:=2.0*Increment;

  Timer1.Enabled:=True;
end;

procedure TPolarForm.CheckBox2Click(Sender: TObject);
begin
  PolarSeries1.Circled:=CheckBox2.Checked;
end;

procedure TPolarForm.PolarSeries1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  ShowMessage('You clicked: '+Sender.Name+#13+
              'Angle : '+FloatToStr(Sender.XValues[ValueIndex])+#13+
              'Radius: '+FloatToStr(Sender.YValues[ValueIndex]));
end;

procedure TPolarForm.Chart1AfterDraw(Sender: TObject);
begin
  Chart1.Canvas.Brush.Style:=bsClear;  { <-- IMPORTANT (Try without) !!! }

  Chart1.Canvas.Pen.Width:= 2;

  { Draw a blue ring passing over the 3rd PolarSeries1 Point }
  Chart1.Canvas.Pen.Color:=clBlue;
  With PolarSeries1 do DrawRing( YValues[2], EndZ );

  { Draw a green ring passing over the 6th PolarSeries2 Point }
  Chart1.Canvas.Pen.Color:=clGreen;
  With PolarSeries2 do DrawRing( YValues[5], EndZ );
end;

procedure TPolarForm.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  begin
    PolarSeries1.Brush.Style:=bsClear;
    PolarSeries2.Brush.Style:=bsClear;
  end
  else
  begin
    PolarSeries1.Brush.Style:=bsDiagCross;
    PolarSeries2.Brush.Style:=bsSolid;
  end;
end;

initialization
  RegisterClass(TPolarForm);
end.
