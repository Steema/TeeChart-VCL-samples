unit Canvas_Cone;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools;

type
  TConesForm = class(TBaseForm)
    Series1: TBarSeries;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    ChartTool1: TRotateTool;
    ComboBox1: TComboBox;
    procedure ScrollBar1Change(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

Uses TeCanvas;

procedure TConesForm.ScrollBar1Change(Sender: TObject);
begin
  TeeDefaultConePercent:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(ScrollBar1.Position)+'%';
  Chart1.Repaint;
end;

procedure TConesForm.Chart1AfterDraw(Sender: TObject);
begin
  With Chart1.Canvas do
    Cone(True,30,30,80,50,0,20,True,ScrollBar1.Position);
end;

procedure TConesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
end;

procedure TConesForm.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then Series1.BarStyle:=bsCone
                           else Series1.BarStyle:=bsPyramid;

  ScrollBar1.Enabled:=Series1.BarStyle=bsCone;
end;

procedure TConesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TConesForm);
end.
