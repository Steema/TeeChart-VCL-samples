unit Series_BigCandle;
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
  Base, BigCandl, TeEngine, Series, OHLChart, CandleCh, TeeProcs, Chart;

type
  TBigCandleForm = class(TBaseForm)
    Series1: TCandleSeries;
    Chart2: TChart;
    Series2: TBigCandleSeries;
    Label1: TLabel;
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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

procedure TBigCandleForm.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmp : Integer;
begin
  Series2.Clear;
  tmp:=Series1.Clicked(x,y);
  if tmp<>-1 then
     With Series1 do
       Series2.AddCandle( DateValues[tmp],OpenValues[tmp],HighValues[tmp],
                          LowValues[tmp],CloseValues[tmp] );
end;

procedure TBigCandleForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

initialization
  RegisterClass(TBigCandleForm);
end.
