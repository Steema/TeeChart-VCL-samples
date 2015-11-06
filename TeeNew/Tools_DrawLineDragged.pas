unit Tools_DrawLineDragged;
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
  Base, TeCanvas, TeEngine, Series, TeeTools, TeeProcs, Chart;

type
  TDrawLineOnDragged = class(TBaseForm)
    ChartTool1: TDrawLineTool;
    Series1: TFastLineSeries;
    Label1: TLabel;
    LabelLinePos: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    procedure ChartTool1DraggedLine(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TDrawLineOnDragged.ChartTool1DraggedLine(Sender: TObject);
begin
  with ChartTool1.Selected do
    LabelLinePos.Caption:='Start: (x: '+
                          FormatFloat('#.##',StartPos.X)+' y: '+
                          FormatFloat('#.##',StartPos.Y)+') '+
                          'End: (x: '+
                          FormatFloat('#.##',EndPos.X)+' y: '+
                          FormatFloat('#.##',EndPos.Y)+
                          ')';
end;

procedure TDrawLineOnDragged.FormCreate(Sender: TObject);
var tmp : Double;
begin
  inherited;
  Series1.FillSampleValues(20); { random values... }

  { create a new DrawLine }
  with TDrawLine.Create(ChartTool1.Lines) do
  begin
    { set the "X" line positions (start and end position) }
    StartPos.X:=5;
    EndPos.X:=15;

    { set the "Y" line positions (start and end position) }
    tmp:=(Series1.YValues.MaxValue-Series1.YValues.MinValue)/5;
    StartPos.Y:=Series1.YValues.MaxValue-tmp;
    EndPos.Y:=Series1.YValues.MinValue+tmp;
  end;

  ChartTool1.Pen.Color:=clBlue;
end;

procedure TDrawLineOnDragged.Edit1Change(Sender: TObject);
begin
  ChartTool1.ClickTolerance:=UpDown1.Position;
end;

initialization
  RegisterClass(TDrawLineOnDragged);
end.
