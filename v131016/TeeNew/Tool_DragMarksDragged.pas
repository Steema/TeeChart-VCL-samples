unit Tool_DragMarksDragged;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, 
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, 
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, BubbleCh, TeeTools;

type
  TDragMarksToolDraggedForm = class(TBaseForm)
    Series1: TBubbleSeries;
    ChartTool1: TDragMarksTool;
    Label1: TLabel;
    Label2: TLabel;
    procedure ChartTool1DraggedMark(Sender: TDragMarksTool; Index: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ChartTool1DraggingMark(Sender: TDragMarksTool;
      Index: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses 
  Math;

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TDragMarksToolDraggedForm.ChartTool1DraggedMark(
  Sender: TDragMarksTool; Index: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Label1.Caption:='Mark index : ' + inttostr(index) + '  dragged';
end;

procedure TDragMarksToolDraggedForm.ChartTool1DraggingMark(
  Sender: TDragMarksTool; Index: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Label2.Caption:='Dragging Mark Pos : '+ FormatFloat('####.##',
    Series1.XScreenToValue(X)) + ' / ' + FormatFloat('####.##',
    Series1.YScreenToValue(Y));
end;

procedure TDragMarksToolDraggedForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.Marks.Transparent:=false;
end;

initialization
  RegisterClass(TDragMarksToolDraggedForm);
end.
