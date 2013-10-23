unit ColorLine_DragRepaint;
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
  TColorLineDragRepaint = class(TBaseForm)
    Series1: TBarSeries;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorLineTool;
    ChartTool3: TColorLineTool;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
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

procedure TColorLineDragRepaint.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.DragRepaint:=CheckBox1.Checked;
  ChartTool2.DragRepaint:=CheckBox1.Checked;
  ChartTool3.DragRepaint:=CheckBox1.Checked;
end;

procedure TColorLineDragRepaint.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.AddArray([40,220,140,512,256,310,60,100,600]);
end;

procedure TColorLineDragRepaint.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
end;

procedure TColorLineDragRepaint.CheckBox3Click(Sender: TObject);
begin
  ChartTool1.DrawBehind:=CheckBox3.Checked;
  ChartTool2.DrawBehind:=CheckBox3.Checked;
  ChartTool3.DrawBehind:=CheckBox3.Checked;
end;

initialization
  RegisterClass(TColorLineDragRepaint);
end.
