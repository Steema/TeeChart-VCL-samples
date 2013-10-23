unit ValueList_FindMinMax;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools;

type
  TFindMinMaxValues = class(TBaseForm)
    Series1: TLineSeries;
    Button1: TButton;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorLineTool;
    ChartTool3: TColorLineTool;
    ChartTool4: TColorLineTool;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

{ This procedure returns the min and max of a portion of
  Series points (from "first" point to "last" point)
 }
Procedure SeriesMinMax( ASeries:TChartSeries; FirstPoint,LastPoint:Integer;
                        Var AMin, AMax : Double);
var t:Integer;
begin
  AMin:=ASeries.YValues[FirstPoint];
  AMax:=ASeries.YValues[FirstPoint];
  for t:=FirstPoint+1 to LastPoint do
      if ASeries.YValues[t]<AMin then AMin:=ASeries.YValues[t]
      else
      if ASeries.YValues[t]>AMax then AMax:=ASeries.YValues[t];
end;

procedure TFindMinMaxValues.Button1Click(Sender: TObject);
var AMin, AMax : Double;
begin
  { Show the Series points between 20 and 50 only }
  Chart1.BottomAxis.SetMinMax(20,50);

  { Now find the min and max for this portion of points }
  SeriesMinMax( Series1, 20, 50, AMin, AMax);

  { For example, set the vertical axis to fit }
  Chart1.LeftAxis.SetMinMax(AMin,AMax);

  Button2.Enabled:=True;
  Button1.Enabled:=False;
end;

procedure TFindMinMaxValues.FormCreate(Sender: TObject);
var AMin,AMax:Double;
begin
  inherited;
  Series1.FillSampleValues(100);

  { move the green lines to the correct positions }
  SeriesMinMax(Series1, 20, 50, AMin, AMax);
  ChartTool3.Value:=AMin;
  ChartTool4.Value:=AMax;
end;

procedure TFindMinMaxValues.Button2Click(Sender: TObject);
begin
  Chart1.LeftAxis.Automatic:=True;
  Chart1.BottomAxis.Automatic:=True;
  Button1.Enabled:=True;
  Button2.Enabled:=False;
end;

initialization
  RegisterClass(TFindMinMaxValues);
end.
