unit RSI_Function;
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
  Base, TeCanvas, TeEngine, StatChar, Series, OHLChart, CandleCh, TeeProcs,
  Chart;

type
  TRSICalcForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TLineSeries;
    TeeFunction1: TRSIFunction;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart1AllowScroll(Sender: TChartAxis; var AMin, AMax: Double;
      var AllowScroll: Boolean);
    procedure FormShow(Sender: TObject);
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

procedure TRSICalcForm.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then TeeFunction1.Style:=rsiOpenClose
                           else TeeFunction1.Style:=rsiClose;
end;

procedure TRSICalcForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position;
end;

procedure TRSICalcForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);

  TeeFunction1.Period:=10;  { take 10 prices }
  TeeFunction1.Style:=rsiOpenClose;  { default calc method }
end;

procedure TRSICalcForm.Chart1AllowScroll(Sender: TChartAxis; var AMin,
  AMax: Double; var AllowScroll: Boolean);
begin
  AllowScroll:=Sender<>Chart1.CustomAxes[0]
end;

procedure TRSICalcForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TRSICalcForm);
end.
