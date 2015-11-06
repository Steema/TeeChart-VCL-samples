unit CurveFitting_NormCoef;
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
  TCurveFittingNormCoef = class(TBaseForm)
    Series1: TFastLineSeries;
    TeeFunction1: TCurveFittingFunction;
    Series2: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowFunction;
  public
    { Public declarations }
  end;

var
  CurveFittingNormCoef: TCurveFittingNormCoef;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCurveFittingNormCoef.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.AddXY(0,4);
  Series1.AddXY(3,5);

  Chart1.Axes.Bottom.SetMinMax(Series1.MinXValue-0.5, Series1.MaxXValue+0.5);
  Chart1.Axes.Left.SetMinMax(Series1.MinYValue-0.5, Series1.MaxYValue+0.5);

  TeeFunction1.PolyDegree:=2;
  Series2.Active:=false;

  { show the polynomy... }
  ShowFunction;
end;

Procedure TCurveFittingNormCoef.ShowFunction;
var tmp : String;
    a1  : Double;
    a0  : Double;
begin
  With TeeFunction1, Series1 do
  begin
    a1 := AnswerVector[2];
    a0 := -AnswerVector[2] * MinXValue + AnswerVector[1] + MinYValue;
  end;

  tmp:='y = ' + FormatFloat('0.0##',a1) + '*x + ' + FormatFloat('0.0##',a0);
  Chart1.Title.Text[0]:=tmp;
end;

initialization
  RegisterClass(TCurveFittingNormCoef);
end.
