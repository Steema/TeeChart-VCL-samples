unit Function_SPC;
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
  Base, TeCanvas, TeEngine, TeeTools, StatChar, Series, TeeProcs, Chart,
  TeeFunci;

type
  TSPCFunctionForm = class(TBaseForm)
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series1: TLineSeries;
    Series2: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    Series3: TLineSeries;
    TeeFunction2: TStdDeviationFunction;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorLineTool;
    ChartTool3: TColorLineTool;
    ChartTool4: TColorLineTool;
    ChartTool5: TColorLineTool;
    ChartTool6: TColorLineTool;
    Series4: TLineSeries;
    TeeFunction3: TAverageTeeFunction;
    Series5: TPointSeries;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function Series2GetPointerStyle(Sender: TChartSeries;
      ValueIndex: Integer): TSeriesPointerStyle;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function CheckRules(Series: TChartSeries; ValueIndex: Integer): Boolean;
    function Rule1(Series: TChartSeries; ValueIndex: Integer): Boolean;
    function Rule2(Series: TChartSeries; ValueIndex: Integer): Boolean;
    function Rule3(Series: TChartSeries; ValueIndex: Integer): Boolean;
    function Rule4(Series: TChartSeries; ValueIndex: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  SPCFunctionForm: TSPCFunctionForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses Math;

procedure TSPCFunctionForm.Edit1Change(Sender: TObject);
begin
  { change the Period value (number of points) }
  TeeFunction1.Period:=UpDown1.Position;
  Button1Click(Self);
end;

procedure TSPCFunctionForm.FormShow(Sender: TObject);
begin
  inherited;
  Edit1.Text:=FloatToStr(TeeFunction1.Period);
  Button1Click(Self);
end;

function TSPCFunctionForm.Series2GetPointerStyle(Sender: TChartSeries;
  ValueIndex: Integer): TSeriesPointerStyle;
begin
  inherited;

  if CheckRules(Sender, ValueIndex) then
    result:=psRectangle
  else
    result:=psCircle;
end;

function TSPCFunctionForm.CheckRules(Series: TChartSeries;
  ValueIndex: Integer): Boolean;
begin
  result:=Rule4(Series, ValueIndex) or Rule3(Series, ValueIndex) or
          Rule2(Series, ValueIndex) or Rule1(Series, ValueIndex);
end;

//A single point outside the control limits
function TSPCFunctionForm.Rule1(Series: TChartSeries;
  ValueIndex: Integer): Boolean;
begin
  result:=(Series.YValue[ValueIndex] > ChartTool5.Value) or
          (Series.YValue[ValueIndex] < ChartTool6.Value);

  if result then
    (Series as TCustomSeries).Pointer.Color:=clRed
  else
    (Series as TCustomSeries).Pointer.Color:=clTeeColor;
end;

//Two of three pts outside the two sigma limit
function TSPCFunctionForm.Rule2(Series: TChartSeries;
  ValueIndex: Integer): Boolean;
var count: Integer;
begin
  count:=1;

  if ValueIndex>1 then
  begin
    if Series.YValue[ValueIndex] > ChartTool3.Value then
  begin
    if Series.YValue[ValueIndex-2] > ChartTool3.Value then inc(count);
    if Series.YValue[ValueIndex-1] > ChartTool3.Value then inc(count);
    end;

    if count=1 then
      if Series.YValue[ValueIndex] < ChartTool4.Value then
    begin
      if Series.YValue[ValueIndex-2] < ChartTool4.Value then inc(count);
      if Series.YValue[ValueIndex-1] < ChartTool4.Value then inc(count);
    end;
  end;

  result:=count>1;

  if result then
    (Series as TCustomSeries).Pointer.Color:=clGreen
  else
    (Series as TCustomSeries).Pointer.Color:=clTeeColor;
end;

//Four of Five pts outside the one sigma limit
function TSPCFunctionForm.Rule3(Series: TChartSeries;
  ValueIndex: Integer): Boolean;
var count,
    i: Integer;
begin
  count:=1;

  if ValueIndex>3 then
  begin
    if Series.YValue[ValueIndex] > ChartTool1.Value then
      for i:=ValueIndex-4 to ValueIndex-1 do
      if Series.YValue[i] > ChartTool1.Value then inc(count);

    if (count=1) and (Series.YValue[ValueIndex] < ChartTool2.Value) then
      for i:=ValueIndex-4 to ValueIndex-1 do
        if Series.YValue[i] < ChartTool2.Value then inc(count);
  end;

  result:=count>3;

  if result then
    (Series as TCustomSeries).Pointer.Color:=clPurple
  else
    (Series as TCustomSeries).Pointer.Color:=clTeeColor;
end;

//Eight in a row on the same side of centerline
function TSPCFunctionForm.Rule4(Series: TChartSeries;
  ValueIndex: Integer): Boolean;
var i: Integer;
    avg: double;
begin
  result:=False;
  avg:=Series4.YValue[0];

  if ValueIndex>7 then
  begin
    for i:=ValueIndex-7 to ValueIndex do
      if Series.YValue[i] < avg then
      begin
        result:=False;
        break;
      end
      else
        result:=True;

    if not result then
      for i:=ValueIndex-7 to ValueIndex do
        if Series.YValue[i] > avg then
        begin
          result:=False;
          break;
        end
        else
          result:=True;
  end;

  if result then
    (Series as TCustomSeries).Pointer.Color:=clYellow
  else
    (Series as TCustomSeries).Pointer.Color:=clTeeColor;
end;

procedure TSPCFunctionForm.Button1Click(Sender: TObject);

  function SubGroupConst(n: Integer): Double;
  begin
    case n of
      1: Result:=2.66;
      2: Result:=1.88;
      3: Result:=1.023;
      4: Result:=0.729;
      5: Result:=0.577;
      6: Result:=0.483;
    else
      Result:=2.66;
    end
  end;

var Avg,
    StdDev,
    RAvg,
    tmp     : Double;
    i       : Integer;
    RSeries,
    RAvgSeries : TChartSeries;
begin
  inherited;

  RSeries:=TChartSeries.Create(Self);
  RAvgSeries:=TChartSeries.Create(Self);

  Chart1.AddSeries(RSeries);
  Chart1.AddSeries(RAvgSeries);

  RSeries.Active:=False;
  RAvgSeries.Active:=False;

  for i:=1 to Series2.Count-1 do
    RSeries.AddXY(Series2.XValue[i], Abs(Series2.YValue[i] - Series2.YValue[i-1]));

  RAvgSeries.FunctionType:=TAverageTeeFunction.Create(Self);
  RAvgSeries.DataSource:=RSeries;

  Avg:=Series4.YValue[0];
  StdDev:=Series3.YValue[0];
  RAvg:=RAvgSeries.YValue[0];

  ChartTool5.Value:=Avg + (RAvg * SubGroupConst(UpDown1.position));
  ChartTool6.Value:=Avg - (RAvg * SubGroupConst(UpDown1.position));
  ChartTool1.Value:=Avg + ((ChartTool5.Value - Avg) * (1/3));
  ChartTool2.Value:=Avg - ((ChartTool5.Value - Avg) * (1/3));
  ChartTool3.Value:=Avg + ((ChartTool5.Value - Avg) * (2/3));
  ChartTool4.Value:=Avg - ((ChartTool5.Value - Avg) * (2/3));
  
  Chart1.Axes.Left.SetMinMax(Min(ChartTool6.Value, Series2.MinYValue) - StdDev,
                              Max(ChartTool5.Value, Series2.MaxYValue) + StdDev);
  Chart1.Axes.Bottom.LabelStyle:=talValue;

  //Dummy series for rules legend
  Series5.Clear;
  tmp:=Chart1.Axes.Left.Maximum * 2;
  Series5.Add(tmp, 'A single point outside the control limits', clRed);
  Series5.Add(tmp, 'Two of three points outside the two sigma limit', clGreen);
  Series5.Add(tmp, 'Four of Five points outside the one sigma limit', clPurple);
  Series5.Add(tmp, 'Eight in a row on the same side of centerline', clYellow);

  for i:=0 to Chart1.SeriesCount-1 do
    if Chart1[i] <> Series5 then
    Chart1[i].ShowInLegend:=False;

  Chart1.Legend.Alignment:=laBottom;
  Chart1.Legend.LegendStyle:=lsValues;
  Chart1.Legend.TextStyle:=ltsPlain;
end;

procedure TSPCFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

initialization
  RegisterClass(TSPCFunctionForm);
end.
