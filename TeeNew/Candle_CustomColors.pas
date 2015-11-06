unit Candle_CustomColors;
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
  TCandleCustomColors = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TCandleSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetCustomColors;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCandleCustomColors.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(30);

  SetCustomColors;
end;

procedure TCandleCustomColors.SetCustomColors;
begin
  { some custom colors... }
  Series1.ValueColor[11]:=clYellow;
  Series1.ValueColor[15]:=clLime;
  Series1.ValueColor[16]:=clBlue;
end;

procedure TCandleCustomColors.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.CandleStyle:=csCandleStick;
    1: Series1.CandleStyle:=csCandleBar;
    2: Series1.CandleStyle:=csOpenClose;
  end;
end;

procedure TCandleCustomColors.CheckBox1Click(Sender: TObject);
var t : Integer;
begin
  if CheckBox1.Checked then SetCustomColors
  else
    { reset colors to default... }
    for t:=0 to Series1.Count-1 do Series1.ValueColor[t]:=clTeeColor;
end;

procedure TCandleCustomColors.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TCandleCustomColors);
end.
