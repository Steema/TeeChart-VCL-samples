unit Function_OBV;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeOBVFunction, Series, CandleCh,
  OHLChart;

type
  TOBVFuncDemo = class(TBaseForm)
    TeeFunction1: TOBVFunction;
    Series1: TCandleSeries;
    Series2: TVolumeSeries;
    Series3: TLineSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TOBVFuncDemo.FormCreate(Sender: TObject);
begin
  inherited;

  // Prepare OBV function:
  TeeFunction1.Volume:=Series2;

  // Other properties set at design-time:
  // Series3.SetFunction(TeeFunction1);
  // Series3.DataSource:=Series1;

  // Sample random Candle and Volume values...
  Series1.FillSampleValues(40);
  Series2.FillSampleValues(40);

  TeeFunction1.ReCalculate;
end;

initialization
  RegisterClass(TOBVFuncDemo);
end.
