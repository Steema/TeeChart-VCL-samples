unit Candle_HighLowPen;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF D16}
  System.UITypes,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, Series, OHLChart, CandleCh, TeCanvas,
  TeePenDlg, TeeProcs, Chart;

type
  TCandleHighLowPen = class(TBaseForm)
    ButtonPen1: TButtonPen;
    ButtonPen2: TButtonPen;
    Series1: TCandleSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonPen2Click(Sender: TObject);
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

procedure TCandleHighLowPen.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);

  ButtonPen1.LinkPen(Series1.Pen);
  ButtonPen2.LinkPen(Series1.HighLowPen);

  Series1.HighLowPen.Color:=clBlue;
  Series1.HighLowPen.Width:=2;

  Series1.CandleWidth:=8;
end;

procedure TCandleHighLowPen.ButtonPen2Click(Sender: TObject);
begin
  CheckBox1.Checked:= Series1.HighLowPen.Color = clTeeColor;
end;

procedure TCandleHighLowPen.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then Series1.HighLowPen.Color:=clTeeColor
                       else Series1.HighLowPen.Color:=clBlue;
end;

initialization
  RegisterClass(TCandleHighLowPen);
end.
