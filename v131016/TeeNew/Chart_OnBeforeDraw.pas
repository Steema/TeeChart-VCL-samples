unit Chart_OnBeforeDraw;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TChartBeforeDraw = class(TBaseForm)
    RadioGroup1: TRadioGroup;
    Series1: TBarSeries;
    procedure Chart1BeforeDrawChart(Sender: TObject);
    procedure Chart1BeforeDrawAxes(Sender: TObject);
    procedure Chart1BeforeDrawSeries(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawTheCircle;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TChartBeforeDraw.DrawTheCircle;
begin
  With Chart1.Canvas do
  begin
    Brush.Color:=clYellow;
    Brush.Style:=bsSolid;
    Pen.Color:=clBlue;
    Pen.Style:=psDot;
    Ellipse(10,10,Chart1.Width-10, Chart1.Height-10);
  end;
end;

procedure TChartBeforeDraw.Chart1BeforeDrawChart(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then DrawTheCircle;
end;

procedure TChartBeforeDraw.Chart1BeforeDrawAxes(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=1 then DrawTheCircle;
end;

procedure TChartBeforeDraw.Chart1BeforeDrawSeries(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=2 then DrawTheCircle;
end;

procedure TChartBeforeDraw.Chart1AfterDraw(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=3 then DrawTheCircle;
end;

procedure TChartBeforeDraw.RadioGroup1Click(Sender: TObject);
begin
  Chart1.Repaint;
end;

procedure TChartBeforeDraw.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

initialization
  RegisterClass(TChartBeforeDraw);
end.
