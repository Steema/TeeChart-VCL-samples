unit Candle_OpenClose;
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
  Base, TeEngine, Series, OHLChart, CandleCh, TeeProcs, Chart;

type
  TCandleOpenClose = class(TBaseForm)
    Series1: TCandleSeries;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
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

procedure TCandleOpenClose.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  Series1.CandleStyle:=csOpenClose;
end;

procedure TCandleOpenClose.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0: Series1.CandleStyle:=csCandleStick;
    1: Series1.CandleStyle:=csCandleBar;
    2: Series1.CandleStyle:=csOpenClose;
  end;
end;

procedure TCandleOpenClose.CheckBox1Click(Sender: TObject);
begin
  Series1.Pointer.Draw3D:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TCandleOpenClose);
end.
