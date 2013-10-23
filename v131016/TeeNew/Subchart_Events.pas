unit Subchart_Events;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeComma, TeePolar,
  TeeSubChart, TeeNumericGauge, TeeLinearGauge, TeeCircularGauge;

type
  TSubchartEvents = class(TBaseForm)
    TeeCommander1: TTeeCommander;
    ChartTool1: TSubChartTool;
    Series1: TPieSeries;
    procedure FormCreate(Sender: TObject);
    procedure ChartTool1Charts0Dragged(Sender: TObject);
    procedure ChartTool1Charts0Dragging(Sender: TObject);
    procedure ChartTool1Charts0Resized(Sender: TObject);
    procedure ChartTool1Charts0Resizing(Sender: TObject);
  private
    { Private declarations }
    procedure SetTitle(TitleText: String);
  public
    { Public declarations }
  end;

var
  SubchartEvents: TSubchartEvents;
implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSubchartEvents.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

procedure TSubchartEvents.ChartTool1Charts0Dragged(Sender: TObject);
begin
  inherited;
  SetTitle('Subchart dragged!');
end;

procedure TSubchartEvents.ChartTool1Charts0Dragging(Sender: TObject);
begin
  inherited;
  SetTitle('Dragging subchart!');
end;

procedure TSubchartEvents.ChartTool1Charts0Resized(Sender: TObject);
begin
  inherited;
  SetTitle('Subchart resized!');
end;

procedure TSubchartEvents.ChartTool1Charts0Resizing(Sender: TObject);
begin
  inherited;
  SetTitle('Resizing subchart!');
end;

procedure TSubchartEvents.SetTitle(TitleText: String);
begin
  With ChartTool1.Charts.Items[0].Chart.Title do
  begin
    Visible:=True;
    Text.Clear;
    Text.Add(TitleText);
  end;
end;

initialization
  RegisterClass(TSubchartEvents);
end.
