unit Function_Performance;
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
  Base, TeEngine, StatChar, Series, TeeProcs, Chart;

type
  TPerfFuncDemo = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TLineSeries;
    TeeFunction1: TPerformanceFunction;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TPerfFuncDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
end;

initialization
  RegisterClass(TPerfFuncDemo);
end.
