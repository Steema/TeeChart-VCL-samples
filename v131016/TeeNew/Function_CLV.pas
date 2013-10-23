unit Function_CLV;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, StatChar, Series, TeeTools,
  CandleCh, OHLChart, TeeProcs, Chart;

type
  TCLVFuncDemo = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TVolumeSeries;
    ChartTool1: TColorLineTool;
    Series3: TLineSeries;
    TeeFunction1: TCLVFunction;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ChartTool2: TColorLineTool;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TCLVFuncDemo.FormCreate(Sender: TObject);
begin
  inherited;

  // Prepare CLV function:
  with TeeFunction1 do
  begin
    Accumulate:=True;
    Volume:=Series2;
  end;

  // Other properties set at design-time:
  // Series3.SetFunction(TeeFunction1);
  // Series3.DataSource:=Series1;

  // Sample random Candle and Volume values...
  Series1.FillSampleValues(20);
  Series2.FillSampleValues(20);

  TeeFunction1.ReCalculate;
end;

procedure TCLVFuncDemo.CheckBox1Click(Sender: TObject);
begin
  TeeFunction1.Accumulate:=CheckBox1.Checked;
end;

procedure TCLVFuncDemo.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
     TeeFunction1.Volume:=Series2
  else
     TeeFunction1.Volume:=nil;
end;

initialization
  RegisterClass(TCLVFuncDemo);
end.
