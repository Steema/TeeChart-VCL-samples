unit Tool_AnnotationCallout;
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
  Base, TeCanvas, TeePenDlg, TeeProcs, TeEngine, Chart, TeeTools, Series;

type
  TAnnotationCallout = class(TBaseForm)
    Button1: TButton;
    ButtonPen1: TButtonPen;
    Series1: TPointSeries;
    ChartTool1: TAnnotationTool;
    CheckBox1: TCheckBox;
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    Procedure SetCallout(AIndex:Integer);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses EditChar;

// Returns Series point index that is nearest to xy position.
Function NearestPoint(ASeries:TChartSeries; x,y:Integer):Integer;
var Difference : Integer;
    tmpDif     : Integer;
    t          : Integer;
begin
  result:=-1;
  Difference:=-1;
  for t:=0 to ASeries.Count-1 do
  begin
    tmpDif:=Round(TeeDistance(ASeries.CalcXPos(t)-x,ASeries.CalcYPos(t)-y));

    if (Difference=-1) or (tmpDif<Difference) then
    begin
      Difference:=tmpDif;
      result:=t;
    end;
  end;
end;

procedure TAnnotationCallout.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmp : Integer;
begin
  if CheckBox1.Checked then  // follow mouse
  begin
    // Locate nearest point to mouse...
    tmp:=NearestPoint(Series1, x, y);

    if tmp<>-1 then SetCallout(tmp);  // set annotation callout
  end;
end;

Procedure TAnnotationCallout.SetCallout(AIndex:Integer);
begin
  // Change annotation text
  ChartTool1.Text:='Point: '+IntToStr(AIndex)+#13+
                   'Value: '+Series1.ValueMarkText[AIndex];

  // Re-position annotation callout
  with ChartTool1.Callout do
  begin
    Visible:=True;
    XPosition:=Series1.CalcXPos(AIndex);
    YPosition:=Series1.CalcYPos(AIndex);
    ZPosition:=0;
  end;
end;

procedure TAnnotationCallout.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;

  // force a first-time chart redrawing, to obtain valid
  // coordinates (Series1.CalcYPos, etc).
  Chart1.Draw;

  // Start positioning annotation callout at point index 5
  SetCallout(5);

  ChartTool1.Callout.Arrow.Visible:=True;

  ButtonPen1.LinkPen(ChartTool1.Callout.Arrow);
end;

procedure TAnnotationCallout.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1);
end;

procedure TAnnotationCallout.CheckBox1Click(Sender: TObject);
begin
  Chart1.Title.Text.Clear;

  if CheckBox1.Checked then
  begin
    Chart1.Title.Text.Add('Move the mouse over points !');
    Series1.Cursor:=crDefault;
  end
  else
  begin
    Chart1.Title.Text.Add('Click a point !');
    Series1.Cursor:=crHandPoint;
  end;
end;

procedure TAnnotationCallout.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not CheckBox1.Checked then
     SetCallout(ValueIndex);
end;

initialization
  RegisterClass(TAnnotationCallout);
end.
