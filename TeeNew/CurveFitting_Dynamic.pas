unit CurveFitting_Dynamic;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,
  {$ENDIF}
  SysUtils, Classes,
  TeEngine, CurvFitt, Series, TeeProcs, Chart, TeeFunci, TeeComma, TeeTools;

type
  TDynamicTrend = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Timer1: TTimer;
    Series2: TAreaSeries;
    Series3: TLineSeries;
    TeeFunction2: TCurveFittingFunction;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ScrollBar3: TScrollBar;
    ScrollBar4: TScrollBar;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    TeeFunction1: TCurveFittingFunction;
    TeeCommander1: TTeeCommander;
    ChartTool1: TRotateTool;
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure ResizeFunction(AFunction:TCustomFittingFunction; APos:Longint);
    Procedure Movefunction(AFunction:TCustomFittingFunction; APos:Longint);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Procedure TDynamicTrend.ResizeFunction(AFunction:TCustomFittingFunction; APos:Longint);
begin
  With AFunction do
  begin
    if (FirstPoint+APos)<((ParentSeries.DataSource) as TChartSeries).Count then
    begin
      BeginUpdate;
      LastPoint:=FirstPoint+APos;
      FirstCalcPoint:=FirstPoint;
      LastCalcPoint:=LastPoint;
      EndUpdate;
      ScrollBar1.Max:=Series1.Count-APos;
    end;
  end;
end;

Procedure TDynamicTrend.MoveFunction(AFunction:TCustomFittingFunction; APos:Longint);
var tmp:Longint;
begin
  with AFunction do
  begin
    tmp:=LastPoint-FirstPoint;
    if APos+tmp<(ParentSeries.DataSource as TChartSeries).Count then
    begin
      BeginUpdate;
      FirstPoint:=APos;
      LastPoint:=FirstPoint+tmp;
      FirstCalcPoint:=FirstPoint;
      LastCalcPoint:=LastPoint;
      EndUpdate;
    end;
  end;
end;

procedure TDynamicTrend.ScrollBar2Change(Sender: TObject);
begin
  ResizeFunction(TeeFunction2,ScrollBar2.Position);
end;

procedure TDynamicTrend.ScrollBar1Change(Sender: TObject);
begin
  MoveFunction(TeeFunction2,ScrollBar1.Position);
end;

procedure TDynamicTrend.Timer1Timer(Sender: TObject);
begin
  With ScrollBar1 do
  begin
    if Position<Max-1 then Position:=Position+1
                      else Position:=Min
  end;
  With ScrollBar3 do
  begin
    if Position<Max-1 then Position:=Position+1
                      else Position:=Min
  end;
end;


procedure TDynamicTrend.ScrollBar3Change(Sender: TObject);
begin
  MoveFunction(TeeFunction1,ScrollBar3.Position);
end;

procedure TDynamicTrend.ScrollBar4Change(Sender: TObject);
begin
  ResizeFunction(TeeFunction1,ScrollBar4.Position);
end;

procedure TDynamicTrend.FormCreate(Sender: TObject);
begin
  { set function first and last points }
  TeeFunction1.FirstPoint:=10;
  TeeFunction1.LastPoint:=40;
  TeeFunction1.FirstCalcPoint:=10;
  TeeFunction1.LastCalcPoint:=40;
  TeeFunction2.FirstPoint:=40;
  TeeFunction2.LastPoint:=70;
  TeeFunction2.FirstCalcPoint:=40;
  TeeFunction2.LastCalcPoint:=70;

  { add sample random values to red line }
  Series1.FillSampleValues(280);
  ScrollBar1.Max:=Series1.Count;
  ScrollBar3.Max:=Series1.Count;

  { default size in number of points }
  ScrollBar2.Position:=30;
  ScrollBar4.Position:=30;
end;

initialization
  RegisterClass(TDynamicTrend);
end.
