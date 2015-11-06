unit Tools_ColorLine;
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
  Base, TeEngine, TeeTools, Series, TeeProcs, Chart, TeCanvas, TeePenDlg;

type
  TColorLineForm = class(TBaseForm)
    Series1: TPointSeries;
    Series2: TLineSeries;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorLineTool;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ButtonPen1: TButtonPen;
    ButtonPen2: TButtonPen;
    Label1: TLabel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CB3DLines: TCheckBox;
    CBDrawBehind: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ChartTool1DragLine(Sender: TColorLineTool);
    procedure ChartTool1EndDragLine(Sender: TColorLineTool);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CB3DLinesClick(Sender: TObject);
    procedure CBDrawBehindClick(Sender: TObject);
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

procedure TColorLineForm.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked;
  ChartTool2.Active:=CheckBox1.Checked;
end;

procedure TColorLineForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
  CB3DLines.Enabled:=CheckBox2.Checked;
end;

procedure TColorLineForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(20);

  ButtonPen1.LinkPen(ChartTool1.Pen);
  ButtonPen2.LinkPen(ChartTool2.Pen);
end;

procedure TColorLineForm.CheckBox3Click(Sender: TObject);
begin
  ChartTool1.AllowDrag:=CheckBox3.Checked;
  ChartTool2.AllowDrag:=CheckBox3.Checked;
end;

procedure TColorLineForm.ChartTool1DragLine(Sender: TColorLineTool);
begin
  { show current line value position }
  Label1.Caption:=FormatFloat('#0.00',Sender.Value);
end;

procedure TColorLineForm.ChartTool1EndDragLine(Sender: TColorLineTool);
begin
  Label1.Caption:='';
end;

procedure TColorLineForm.CheckBox4Click(Sender: TObject);
begin
  ChartTool1.DragRepaint:=CheckBox4.Checked;
  ChartTool2.DragRepaint:=CheckBox4.Checked;
end;

procedure TColorLineForm.CheckBox5Click(Sender: TObject);
begin
  ChartTool1.NoLimitDrag:=CheckBox5.Checked;
  ChartTool2.NoLimitDrag:=CheckBox5.Checked;
end;

procedure TColorLineForm.CB3DLinesClick(Sender: TObject);
begin
  ChartTool1.Draw3D:=CB3DLines.Checked;
  ChartTool2.Draw3D:=CB3DLines.Checked;
end;

procedure TColorLineForm.CBDrawBehindClick(Sender: TObject);
begin
  ChartTool1.DrawBehind:=CBDrawBehind.Checked;
  ChartTool2.DrawBehind:=CBDrawBehind.Checked;
end;

initialization
  RegisterClass(TColorLineForm);
end.
