unit CurveFitting_Coef;
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
  Base, TeEngine, CurvFitt, Series, TeeProcs, Chart, TeeShape, TeeTools;

type
  TCurveFittingCoef = class(TBaseForm)
    Series1: TFastLineSeries;
    TeeFunction1: TCurveFittingFunction;
    Series2: TFastLineSeries;
    Label1: TLabel;
    Label2: TLabel;
    Series3: TChartShape;
    ChartTool1: TMarksTipTool;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    Procedure ShowFunction;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCurveFittingCoef.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);

  { set the "shape" xy as pixels... }
  Series3.XYStyle:=xysPixels;

  { show the polynomy... }
  ShowFunction;
end;

Procedure TCurveFittingCoef.ShowFunction;
var t   : Integer;
    tmp : String;
begin
  tmp:='y=';
  With TeeFunction1 do
  for t:=1 to PolyDegree do
  begin
    tmp:=tmp+' ';
    if AnswerVector[t]>=0 then tmp:=tmp+'+';
    tmp:=tmp+FormatFloat('0.0##',AnswerVector[t])+'*x';
    if t>1 then tmp:=tmp+'^'+IntToStr(t);
  end;

  { show the expression }
  Label2.Caption:=tmp;
end;

procedure TCurveFittingCoef.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmpX,tmpY : Double;
begin
  { convert from "X" pixels to axis... }
  tmpX:=Chart1.BottomAxis.CalcPosPoint(X);

  { calculate the "Y" value for a given "X" }
  tmpY:=TeeFunction1.GetCurveYValue(Series1,tmpX);

  { convert from "Y" axis to pixels... }
  Y:=Chart1.LeftAxis.CalcPosValue(tmpY);

  { set the "circle shape" bounds... }
  Series3.X0:=X-10;
  Series3.X1:=X+10;
  Series3.Y0:=Y-10;
  Series3.Y1:=Y+10;
  Series3.Active:=True;
end;

initialization
  RegisterClass(TCurveFittingCoef);
end.
