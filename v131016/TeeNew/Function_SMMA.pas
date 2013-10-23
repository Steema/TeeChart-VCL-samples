unit Function_SMMA;
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
  Base, TeEngine, TeCanvas, Series, OHLChart, CandleCh, TeeProcs, Chart,
  StatChar;

type
  TSMMAFunctionForm = class(TBaseForm)
    Series1: TCandleSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series2: TLineSeries;
    TeeFunction1: TMovingAverageFunction;
    Series3: TLineSeries;
    TeeFunction2: TSmoothedMovAvgFunction;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SMMAFunctionForm: TSMMAFunctionForm;
  
implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSMMAFunctionForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position;
  TeeFunction2.Period:=UpDown1.Position;
end;

procedure TSMMAFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TSMMAFunctionForm);
end.
