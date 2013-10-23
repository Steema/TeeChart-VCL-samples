unit Exponential_Trend;
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
  Base, CurvFitt, Series, TeEngine, TeeProcs, Chart;

type
  TExponentialTrendForm = class(TBaseForm)
    Series1: TFastLineSeries;
    TeeFunction1: TExpTrendFunction;
    Series2: TFastLineSeries;
    Series3: TLineSeries;
    TeeFunction2: TTrendFunction;
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

procedure TExponentialTrendForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(1000);
end;

initialization
  RegisterClass(TExponentialTrendForm);
end.
