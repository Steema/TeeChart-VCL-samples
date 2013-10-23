unit SeriesType_Candle;
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
  Base, TeEngine, TeeTools, Series, OHLChart, CandleCh, TeeProcs, Chart,
  TeCanvas, TeePenDlg;

type
  TCandleForm = class(TBaseForm)
    Series1: TCandleSeries;
    ChartTool1: TMarksTipTool;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ButtonColor1: TButtonColor;
    ButtonColor2: TButtonColor;
    Button1: TButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

Uses EditChar;

procedure TCandleForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Pen.Visible:=CheckBox1.Checked;
end;

procedure TCandleForm.CheckBox2Click(Sender: TObject);
begin
  Series1.Draw3D:=CheckBox2.Checked;
  Chart1.View3D:=CheckBox2.Checked;
end;

procedure TCandleForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues(20);
  
  ButtonColor1.LinkProperty(Series1,'UpCloseColor');
  ButtonColor2.LinkProperty(Series1,'DownCloseColor');
end;

procedure TCandleForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TCandleForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.CandleStyle:=csCandleStick;
    1: Series1.CandleStyle:=csCandleBar;
    2: Series1.CandleStyle:=csOpenClose;
  end;
end;

procedure TCandleForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TCandleForm);
end.
