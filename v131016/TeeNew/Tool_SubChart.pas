unit Tool_SubChart;
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
  Base, TeEngine, Series, BubbleCh, TeeProcs, Chart, TeeTools, TeeSubChart,TeeThemes,
  TeeComma;

type
  TSubChartToolForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TAreaSeries;
    ChartTool1: TGridBandTool;
    TeeCommander1: TTeeCommander;
    TeeCommander2: TTeeCommander;
    procedure FormCreate(Sender: TObject);
    procedure Chart1Resize(Sender: TObject);
  private
    { Private declarations }
    SubChart : TSubChartTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSubChartToolForm.FormCreate(Sender: TObject);
begin
  inherited;

  TeeCommander1.Panel:=Chart1;

  SubChart:=TSubChartTool.Create(Self);
  with SubChart do
  begin
    ParentChart:=Chart1;
    Charts.AddChart('Chart1');

    with Charts[0] do
    begin
      Height:=130;
      Width:=170;
      TeeCommander2.Panel:=Chart;

      with Chart do
      begin
        BevelOuter:=bvLowered;
        AddSeries(TBubbleSeries.Create(self));
        Series[0].FillSampleValues(5);
        MarginTop:=5;
        MarginBottom:=5;
        MarginLeft:=5;
        MarginRight:=5;
        ApplyChartTheme(ChartThemes.Theme[3],Chart,7);
      end;

    end;

  end;
end;

procedure TSubChartToolForm.Chart1Resize(Sender: TObject);
begin
    Chart1.Repaint;
    with SubChart.Charts[0] do
    begin
      Left:= Chart1.ChartRect.Right-Width-25;
      Top := Chart1.ChartRect.Top+5;
    end;
end;

initialization
  RegisterClass(TSubChartToolForm);
end.
