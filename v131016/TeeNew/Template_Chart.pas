unit Template_Chart;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF CLX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, QActnList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ActnList,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeChartActions;

type
  TTemplateChart = class(TBaseForm)
    TemplateChart: TChart;
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    ChartActionEdit1: TChartActionEdit;
    Splitter1: TSplitter;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeStore;

procedure TTemplateChart.Button2Click(Sender: TObject);
var tmp : TMemoryStream;
    {$IFDEF CLR}
    tmpChart : TCustomChart;
    {$ENDIF}
begin
  { 1) Save the template into a Stream... }
  tmp:=TMemoryStream.Create;
  try
    { save only Chart and Series formatting, NOT including data }
    SaveChartToStream(TemplateChart,tmp,False);

    { 2) Load the template into other Chart... }
    tmp.Position:=0; { <-- set stream position to beggining of stream }

    {$IFDEF CLR}

    tmpChart:=TCustomChart(Chart1);
    LoadChartFromStream(tmpChart,tmp);
    Chart1:=TChart(tmpChart);

    {$ELSE}
    LoadChartFromStream(TCustomChart(Chart1),tmp);
    {$ENDIF}

    { restore the chart alignment (in this example) }
    Chart1.Align:=alClient;

    { repaint the Chart }
    Chart1.Repaint;
  finally
    { remove the stream, it's no longer necessary... }
    tmp.Free;
  end;
end;

procedure TTemplateChart.FormCreate(Sender: TObject);
begin
  inherited;
  { global variable, to add sample random points at runtime,
    automatically when adding a new series to Chart }
  TeeRandomAtRunTime:=True;
end;

procedure TTemplateChart.FormDestroy(Sender: TObject);
begin
  TeeRandomAtRunTime:=False; { disable adding sample random points at runtime }
  inherited;
end;

initialization
  RegisterClass(TTemplateChart);
end.
