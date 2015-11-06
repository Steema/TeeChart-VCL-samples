unit Series_Shape;
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
  Base, TeEngine, TeeShape, TeeProcs, Chart;

type
  TShapeSeriesForm = class(TBaseForm)
    Series1: TChartShape;
    Series2: TChartShape;
    Series3: TChartShape;
    Series4: TChartShape;
    Series5: TChartShape;
    CheckBox1: TCheckBox;
    procedure Series1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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

Uses EditChar;

procedure TShapeSeriesForm.Series1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  EditSeries(Self,Sender); { when a shape is clicked... }
  Chart1.CancelMouse:=True; { stop mouse zooming }
end;

procedure TShapeSeriesForm.CheckBox1Click(Sender: TObject);
var t:Integer;
begin
  for t:=0 to Chart1.SeriesCount-1 do
      if Chart1[t] is TChartShape then
         TChartShape(Chart1[t]).Transparent:=CheckBox1.Checked
end;

initialization
  RegisterClass(TShapeSeriesForm);
end.
