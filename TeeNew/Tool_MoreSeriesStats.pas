unit Tool_MoreSeriesStats;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeSeriesStats,
  TeeFunci;
  


type
  TMoreSeriesStatsToolForm = class(TBaseForm)
    Series2: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    Memo2: TMemo;
    bEdit: TButton;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
  private
    { Private declarations }
    SeriesStats : TSeriesStatsTool;
  public
    { Public declarations }
  end;

var
  MoreSeriesStatsToolForm: TMoreSeriesStatsToolForm;  

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses EditChar;

procedure TMoreSeriesStatsToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  SeriesStats:=TSeriesStatsTool.Create(self);
  with SeriesStats do
  begin
    Series:=Series1;
  end;
  Chart1.Tools.Add(SeriesStats);

  SeriesStats.Statistics(Memo2.Lines);
end;

procedure TMoreSeriesStatsToolForm.bEditClick(Sender: TObject);
begin
  EditChartTool(Self,Chart1.Tools[0]);
end;

initialization
  RegisterClass(TMoreSeriesStatsToolForm);
end.
