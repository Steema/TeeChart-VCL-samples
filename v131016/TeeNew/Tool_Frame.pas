unit Tool_Frame;
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
  Base, Series, Chart, TeeTools,TeeFrameTool, TeeProcs, TeEngine;
  

type
  TFrameToolForm = class(TBaseForm)
    Series1: TAreaSeries;
    ScrollBar4: TScrollBar;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    cbStyle: TComboBox;
    Label3: TLabel;
    procedure ScrollBar4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
  private
    { Private declarations }
    FrameTool : TFrameTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFrameToolForm.ScrollBar4Change(Sender: TObject);
var tmp : Integer;
begin
  tmp:=ScrollBar4.Position;
  with Chart1 do
  begin
    MarginUnits:=muPixels;
    MarginBottom:=tmp;
    MarginTop:=tmp;
    MarginRight:=tmp;
    MarginLeft:=tmp;
  end;

  if FrameTool.Brush.Style<>bsClear then
     Inc(tmp,FrameTool.Paspartou);

  Chart1.Legend.TopPos:=tmp div 2;

  FrameTool.Size:=ScrollBar4.Position;

  Label2.Caption:=IntToStr(FrameTool.Size);
end;

procedure TFrameToolForm.FormCreate(Sender: TObject);
begin
  FrameTool:=TFrameTool.Create(Self);

  Chart1.Tools.Add(FrameTool);

  cbStyle.ItemIndex:=3;

  with FrameTool do
  begin
    Size:=45;
    Style:=4;
    Brush.Style:=bsSolid
  end;
end;

procedure TFrameToolForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     FrameTool.Brush.Style:=bsSolid
  else
     FrameTool.Brush.Style:=bsClear;
end;

procedure TFrameToolForm.cbStyleChange(Sender: TObject);
begin
  FrameTool.Style:=cbStyle.ItemIndex+1;
end;

initialization
  RegisterClass(TFrameToolForm);
end.
