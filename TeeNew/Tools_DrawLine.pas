unit Tools_DrawLine;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, TeCanvas, Series, TeePenDlg;

type
  TDrawLineToolDemo = class(TBaseForm)
    Series1: TFastLineSeries;
    ChartTool1: TDrawLineTool;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    NumLines: TLabel;
    ButtonPen1: TButtonPen;
    Label2: TLabel;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ButtonDelete: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChartTool1NewLine(Sender: TObject);
    procedure ButtonPen1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ChartTool1Select(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TDrawLineToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked
end;

procedure TDrawLineToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);
  ButtonPen1.LinkPen(ChartTool1.Pen);
end;

procedure TDrawLineToolDemo.ChartTool1NewLine(Sender: TObject);
begin
  NumLines.Caption:=IntToStr(ChartTool1.Lines.Count);
end;

procedure TDrawLineToolDemo.ButtonPen1Click(Sender: TObject);
begin
  inherited;
  Chart1.Repaint;
end;

procedure TDrawLineToolDemo.ComboBox1Change(Sender: TObject);
begin
  ChartTool1.Button:=TMouseButton(ComboBox1.ItemIndex)
end;

procedure TDrawLineToolDemo.CheckBox2Click(Sender: TObject);
begin
  ChartTool1.EnableDraw:=CheckBox2.Checked
end;

procedure TDrawLineToolDemo.CheckBox3Click(Sender: TObject);
begin
  ChartTool1.EnableSelect:=CheckBox3.Checked
end;

procedure TDrawLineToolDemo.ChartTool1Select(Sender: TObject);
begin
  ButtonDelete.Enabled:=True;
end;

procedure TDrawLineToolDemo.ButtonDeleteClick(Sender: TObject);
begin
  ChartTool1.DeleteSelected;
  ButtonDelete.Enabled:=False;
end;

procedure TDrawLineToolDemo.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TDrawLineToolDemo);
end.
