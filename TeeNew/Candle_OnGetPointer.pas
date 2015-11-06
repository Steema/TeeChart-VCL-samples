unit Candle_OnGetPointer;
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
  Base, TeEngine, Series, OHLChart, CandleCh, TeeProcs, Chart, TeCanvas,
  TeeGDIPlus, TeeTools;

type
  TCandleOnGetPointer = class(TBaseForm)
    Series1: TCandleSeries;
    CheckBox1: TCheckBox;
    GridBandTool1: TGridBandTool;
    function Series1GetPointerStyle(Sender: TChartSeries;
      ValueIndex: Integer): TSeriesPointerStyle;
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

function TCandleOnGetPointer.Series1GetPointerStyle(Sender: TChartSeries;
  ValueIndex: Integer): TSeriesPointerStyle;
begin
  if CheckBox1.Checked then
  begin
    { change some candle colors... }
    if ValueIndex mod 2 = 0 then
    begin
      result:=psRectangle;
      Series1.Pointer.Pen.Color:=clOlive;
    end
    else
    begin
      result:=psDiamond;
      Series1.Pointer.Pen.Color:=clTeal;
    end;
  end
  else
  begin
    result:=psRectangle; { default }
    Series1.Pointer.Pen.Color:=clBlack;
  end;
end;

procedure TCandleOnGetPointer.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TCandleOnGetPointer.CheckBox1Click(Sender: TObject);
begin
  Series1.Repaint;
end;

initialization
  RegisterClass(TCandleOnGetPointer);
end.
