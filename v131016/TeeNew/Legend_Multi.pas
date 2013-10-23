unit Legend_Multi;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TMultiLegendForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    CheckBox1: TCheckBox;
    procedure Chart1AfterDraw(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TMultiLegendForm.Chart1AfterDraw(Sender: TObject);
begin
  if CheckBox1.Checked then
  With Chart1.Legend do
  begin
    Top:=125;
    Series:=Series2;
    DrawLegend;
    CustomPosition:=False;
    Series:=Series1;
  end;
end;

procedure TMultiLegendForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(4);

  Chart1.Legend.LegendStyle:=lsValues;
  Chart1.Legend.Series:=Series1;
end;

procedure TMultiLegendForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.Repaint;
end;

initialization
  RegisterClass(TMultiLegendForm);
end.
