unit Tool_RectangleAllowDragResize;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, TeeTools, BubbleCh;

type
  TToolRectangleAllowDragResize = class(TBaseForm)
    cbDrag: TCheckBox;
    cbResize: TCheckBox;
    bEdit: TButton;
    Series1: TBubbleSeries;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure cbDragClick(Sender: TObject);
    procedure cbResizeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tool : TRectangleTool;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  EditChar;

procedure TToolRectangleAllowDragResize.FormCreate(Sender: TObject);
begin
  inherited;

  // Create tool
  Tool := TRectangleTool.Create(self);
  // Add to Chart
  Chart1.Tools.Add(Tool);

  // Tool Settings
  with Tool do
  begin
    Shape.Left:=100;
    Shape.Top:= 50;
    Width:=250;
    Height:=150;
    Shape.Color:=clRed;
    Shape.Transparency:=80;
  end;
end;

procedure TToolRectangleAllowDragResize.bEditClick(Sender: TObject);
begin
  EditChartTool(self,Tool);
end;

procedure TToolRectangleAllowDragResize.cbDragClick(Sender: TObject);
begin
  Tool.AllowDrag:=cbDrag.Checked;
end;

procedure TToolRectangleAllowDragResize.cbResizeClick(Sender: TObject);
begin
  Tool.AllowResize:=cbResize.Checked;
end;

initialization
  RegisterClass(TToolRectangleAllowDragResize);
end.
