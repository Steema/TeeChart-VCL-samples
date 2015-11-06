unit Legend_CheckBox;
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
  Base, ErrorBar, Series, CandleCh, BubbleCh, TeEngine, StatChar,
  TeeProcs, Chart;

type
  TLegendCheckbox = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TBarSeries;
    Series3: TAreaSeries;
    Series4: TPointSeries;
    Series5: TFastLineSeries;
    Series6: TBubbleSeries;
    Series7: TVolumeSeries;
    Series8: THistogramSeries;
    Series9: TErrorBarSeries;
    Series10: THighLowSeries;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
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

procedure TLegendCheckbox.CheckBox1Click(Sender: TObject);
begin
  Chart1.Legend.CheckBoxes:=CheckBox1.Checked;
end;

procedure TLegendCheckbox.FormCreate(Sender: TObject);
var t:Integer;
begin
  inherited;
  for t:=0 to Chart1.SeriesCount-1 do
    Chart1.Series[t].FillSampleValues(Chart1.Series[t].NumSampleValues);
end;

initialization
  RegisterClass(TLegendCheckBox);
end.
