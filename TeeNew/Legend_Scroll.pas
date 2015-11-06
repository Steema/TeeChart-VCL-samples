unit Legend_Scroll;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, Series;

type
  TLegendScroll = class(TBaseForm)
    Series1: TLineSeries;
    ChartTool1: TColorLineTool;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ChartTool1EndDragLine(Sender: TColorLineTool);
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

procedure TLegendScroll.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);
  ScrollBar1.Max:=Series1.Count-1;
end;

procedure TLegendScroll.ScrollBar1Change(Sender: TObject);
begin
  Chart1.Legend.FirstValue:=ScrollBar1.Position;
  ChartTool1.Value:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(Chart1.Legend.FirstValue);
end;

procedure TLegendScroll.ChartTool1EndDragLine(Sender: TColorLineTool);
begin
  ScrollBar1Change(Self);
end;

initialization
  RegisterClass(TLegendScroll);
end.
