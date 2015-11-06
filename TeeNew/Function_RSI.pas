unit Function_RSI;
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
  Base, TeCanvas, TeEngine, TeeTools, StatChar, Series, OHLChart, CandleCh,
  TeeProcs, Chart;

type
  TRSIFunctionForm = class(TBaseForm)
    Label1: TLabel;
    Series1: TCandleSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    TeeFunction1: TRSIFunction;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorLineTool;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TRSIFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(50);

  { align the two charts on the left side... }
  Chart1.LeftAxis.LabelsSize:=30;
  Chart2.LeftAxis.LabelsSize:=30;

  { align the bottom axis... }
  Chart2.BottomAxis.SetMinMax(Series1.XValues.MinValue,Series1.XValues.MaxValue);
end;

procedure TRSIFunctionForm.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then TeeFunction1.Style:=rsiOpenClose
                           else TeeFunction1.Style:=rsiClose;
end;

procedure TRSIFunctionForm.Edit1Change(Sender: TObject);
begin
  { change the RSI "period" value (number of points) }
  TeeFunction1.Period:=UpDown1.Position;
end;

procedure TRSIFunctionForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TRSIFunctionForm);
end.
