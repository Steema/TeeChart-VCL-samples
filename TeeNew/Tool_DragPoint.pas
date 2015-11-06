unit Tool_DragPoint;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Grids,
  {$ENDIF}
  Base, TeeChartGrid, TeeProcs, TeEngine, Chart, TeeDragPoint, Series;

type
  TDragPointToolDemo = class(TBaseForm)
    ChartGrid1: TChartGrid;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Series1: TLineSeries;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DragPoint : TDragPointTool;
    procedure DragPointEvent(Sender:TDragPointTool; Index:Integer);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TDragPointToolDemo.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,DragPoint);
end;

procedure TDragPointToolDemo.ComboBox1Change(Sender: TObject);
begin
  { set the allowed dragging direction... }
  Case ComboBox1.ItemIndex of
    0: DragPoint.DragStyle:=dsX;
    1: DragPoint.DragStyle:=dsY;
  else
    DragPoint.DragStyle:=dsBoth;
  end;
end;

procedure TDragPointToolDemo.CheckBox1Click(Sender: TObject);
begin
  DragPoint.Active:=CheckBox1.Checked;

  { change the series cursor: }
  if DragPoint.Active then Series1.Cursor:=crTeeHand
                      else Series1.Cursor:=crDefault;
end;

procedure TDragPointToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);

  { create the tool... }
  DragPoint:=TDragPointTool.Create(Self);
  DragPoint.ParentChart:=Chart1;
  DragPoint.Series:=Series1;

  { set the event... }
  DragPoint.OnDragPoint:=DragPointEvent;

  { set the grid series: }
  ChartGrid1.Series:=Series1;

  { tell the grid to show both the X and Y }
  ChartGrid1.ShowXValues:=cgsYes;

  { do not show labels at chart grid }
  ChartGrid1.ShowLabels:=False;

  { set the Series cursor: }
  Series1.Cursor:=crTeeHand;
end;

{ this event gets called whenever a point is dragged... }
procedure TDragPointToolDemo.DragPointEvent(Sender:TDragPointTool; Index:Integer);
begin
  ChartGrid1.Repaint;  { repaint the grid to show the new values... }
end;

procedure TDragPointToolDemo.FormShow(Sender: TObject);
begin
  inherited;
  { allow dragging in both X and Y directions }
  ComboBox1.ItemIndex:=2;
end;

initialization
  RegisterClass(TDragPointToolDemo);
end.
