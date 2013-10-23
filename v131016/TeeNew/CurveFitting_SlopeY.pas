unit CurveFitting_SlopeY;
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
  TCurveFittingSlopeY = class(TBaseForm)
    Series1: TFastLineSeries;
    TeeFunction1: TCurveFittingFunction;
    Series2: TFastLineSeries;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowSlopeAndY;
  public
    { Public declarations }
  end;

var
  CurveFittingSlopeY: TCurveFittingSlopeY;  

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCurveFittingSlopeY.FormCreate(Sender: TObject);
begin
  inherited;

  TeeFunction1.PolyDegree:=2;
  Series2.Active:=false;

  Chart1.Axes.Left.SetMinMax(0, 1);
  Chart1.Axes.Bottom.SetMinMax(-0.5, 0.5);

  Button1Click(Self);
end;

Procedure TCurveFittingSlopeY.ShowSlopeAndY;
var slope       : Double;
    yIntercept  : Double;
begin
  With TeeFunction1, Series1 do
  begin
    slope := AnswerVector[2];
    yIntercept := -AnswerVector[2] * MinXValue + AnswerVector[1] + MinYValue;
  end;

  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Slope = ' + FormatFloat('0.0##',slope));
  Chart1.Title.Text.Add('Y-Intercept = ' + FormatFloat('0.0##',yIntercept));
end;

procedure TCurveFittingSlopeY.Button1Click(Sender: TObject);
begin
  inherited;

  Series1.Clear;
  Series1.AddXY(random - 0.5,random);
  Series1.AddXY(random - 0.5,random);

  Series2.CheckDataSource;

  { show slope and Y-intercept ... }
  ShowSlopeAndY;
end;

initialization
  RegisterClass(TCurveFittingSlopeY);
end.
