unit Candle_AxisLabels;
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
  TCandleAxisLabels = class(TBaseForm)
    Series1: TCandleSeries;
    procedure FormCreate(Sender: TObject);
    procedure Chart1GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
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

procedure TCandleAxisLabels.FormCreate(Sender: TObject);
var tmpOpen  : Double;
    tmpClose : Double;
    t        : Integer;
    tmpYear  : Word;
    tmpMonth : Word;
    tmpDay   : Word;
begin
  inherited;
  { no dates }
  Series1.XValues.DateTime:=False;

  { fill the candle with random points }
  tmpOpen:=Random(1000);

  Series1.Clear;
  for t:=1 to 100 do
  begin
    tmpOpen :=tmpOpen+(Random(100)-50);
    tmpClose:=tmpOpen-(Random(100)-50);

    { add the point }
    Series1.AddCandle( t, tmpOpen, tmpOpen+Random(10),
                          tmpClose-Random(10), tmpClose );

    { set the LABEL to be the date in "yyyymmdd" format }
    DecodeDate(Date+t, tmpYear, tmpMonth, tmpDay );
    Series1.Labels[ Series1.Count-1 ]:= FormatFloat('0000',tmpYear)+
                                        FormatFloat('00',tmpMonth)+
                                        FormatFloat('00',tmpDay);
  end;
end;

{ The Chart OnGetAxisLabel event }
procedure TCandleAxisLabels.Chart1GetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var tmpM : Integer;
begin

  { show the month name or the day number }

  if Sender=Series1.GetHorizAxis then
  if (Series1.Count>0) and (ValueIndex<>-1) then
  begin
    if (Sender.Maximum-Sender.Minimum)>30 then { more than one month }
    begin
      tmpM:=StrToInt(Copy(Series1.Labels[ValueIndex],5,2));

      { first label }
      if ValueIndex=0 then
         LabelText:={$IFDEF D15}FormatSettings.{$ENDIF}ShortMonthNames[tmpM]
      else
      { other labels }
      if StrToInt(Copy(Series1.Labels[ValueIndex-1],5,2))<>tmpM then
         LabelText:={$IFDEF D15}FormatSettings.{$ENDIF}ShortMonthNames[tmpM]
      else
         LabelText:='';
    end
    else { just day-of-the-month numbers }
       LabelText:=Copy(Series1.Labels[ValueIndex],7,2);
  end;
end;

initialization
  RegisterClass( TCandleAxisLabels );
end.
