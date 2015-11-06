unit SeriesType_Clock;
{$I TeeDefs.inc}

{$IFDEF D7}
{$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

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
  Base, TeCanvas, TeEngine, Series, TeePolar, TeeRose, TeeProcs, Chart,
  TeeGDIPlus, TeeNumericGauge, TeeLinearGauge, TeeCircularGauge;

type
  TClockSeriesForm = class(TBaseForm)
    Panel2: TPanel;
    Chart6: TChart;
    Series5: TClockSeries;
    Chart5: TChart;
    Series4: TClockSeries;
    Panel3: TPanel;
    Chart7: TChart;
    Series6: TClockSeries;
    Chart4: TChart;
    Series3: TClockSeries;
    Panel4: TPanel;
    Chart3: TChart;
    Series2: TClockSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Label4: TLabel;
    Panel5: TPanel;
    Chart2: TChart;
    Series1: TClockSeries;
    Chart8: TChart;
    Series7: TClockGauge;
    procedure CheckBox1Click(Sender: TObject);
    procedure Series2GetTime(Sender: TClockSeries;
      var ATime: TDateTime);
    procedure Edit2Change(Sender: TObject);
    procedure Chart7DblClick(Sender: TObject);
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

uses EditChar;

procedure TClockSeriesForm.CheckBox1Click(Sender: TObject);
var tmp : TClockSeriesStyle;
begin
  if CheckBox1.Checked then tmp:=cssRoman else tmp:=cssDecimal;
  Series1.Style:=tmp;
  Series2.Style:=tmp;
  Series3.Style:=tmp;
  Series4.Style:=tmp;
  Series5.Style:=tmp;
  Series6.Style:=tmp;
end;

procedure TClockSeriesForm.Series2GetTime(Sender: TClockSeries;
  var ATime: TDateTime);
Const HoursDay=1/24;
begin
  ATime:=ATime + (HoursDay * UpDown1.Position) ;
end;

procedure TClockSeriesForm.Edit2Change(Sender: TObject);
begin // change clock timers
  Series1.Timer.Interval:=UpDown2.Position;
  Series2.Timer.Interval:=UpDown2.Position;
  Series3.Timer.Interval:=UpDown2.Position;
  Series4.Timer.Interval:=UpDown2.Position;
  Series5.Timer.Interval:=UpDown2.Position;
  Series6.Timer.Interval:=UpDown2.Position;
end;

procedure TClockSeriesForm.Chart7DblClick(Sender: TObject);
begin
  EditChart(Self,Sender as TChart);
end;

procedure TClockSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart3.Legend.Show;
  Chart3.Legend.Symbol.Visible:=False;
end;

initialization
  RegisterClass(TClockSeriesForm);
end.
