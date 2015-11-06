unit Tool_DrawLineAddLine;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, Series, Bar3D;

type
  TDrawLineAddLineToolForm = class(TBaseForm)
    Label1: TLabel;
    bAdd: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tbX0: TEdit;
    tbY0: TEdit;
    tbX1: TEdit;
    tbY1: TEdit;
    Series1: TBar3DSeries;
    procedure bAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Tool : TDrawLineTool;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TDrawLineAddLineToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Create tool
  Tool:=TDrawLineTool.Create(Self);

  // Set Series
  Tool.Series:=Series1;

  // Add to chart
  Chart1.Tools.Add(Tool);
  with Tool do
  begin
    Lines.AddLine(1,50,4,100);
    EnableDraw:=false;
    Pen.Color:=clNavy;
  end;
end;

procedure TDrawLineAddLineToolForm.bAddClick(Sender: TObject);
var X0,Y0,X1,Y1 : double;
begin
  X0:=StrToFloat(tbX0.Text);
  Y0:=StrToFloat(tbY0.Text);
  X1:=StrToFloat(tbX1.Text);
  Y1:=StrToFloat(tbY1.Text);

  Tool.Lines.AddLine(X0,Y0,X1,Y1);
  Chart1.Repaint;
end;

initialization
  RegisterClass(TDrawLineAddLineToolForm);
end.
