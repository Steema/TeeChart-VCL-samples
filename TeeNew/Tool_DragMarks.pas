unit Tool_DragMarks;
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
  Base, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TDragMarksToolDemo = class(TBaseForm)
    Series1: TPointSeries;
    ChartTool1: TDragMarksTool;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Series2: TLineSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
Uses EditChar;

procedure TDragMarksToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked;
end;

procedure TDragMarksToolDemo.Button1Click(Sender: TObject);
begin
  Series1.Marks.ResetPositions;
  Series2.Marks.ResetPositions;
end;

procedure TDragMarksToolDemo.Button2Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1);
end;

procedure TDragMarksToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  Series1.Marks.Callout.Length:=10;
  Series2.FillSampleValues(6);
end;

initialization
  RegisterClass(TDragMarksToolDemo);
end.
