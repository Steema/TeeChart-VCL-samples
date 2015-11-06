unit Tool_SeriesStats;
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
  TSeriesStatsToolForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    Memo2: TMemo;
    bEdit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
  private
    { Private declarations }
    SeriesStats : TSeriesStatsTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses EditChar;

procedure TSeriesStatsToolForm.FormCreate(Sender: TObject);
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

procedure TSeriesStatsToolForm.bEditClick(Sender: TObject);
begin
  EditChartTool(Self,Chart1.Tools[0]);
end;

initialization
  RegisterClass(TSeriesStatsToolForm);
end.
