unit Function_ATR;
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
  Base, TeEngine, TeCanvas, Series, OHLChart, CandleCh, TeeProcs, Chart;

type
  TATRFunctionForm = class(TBaseForm)
    Series1: TCandleSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series2: TLineSeries;
    TeeFunction1: TATRFunction;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ATRFunctionForm: TATRFunctionForm;  

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TATRFunctionForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position;
  Chart1.Title.Text[0]:='ATR(' + FloatToStr(TeeFunction1.Period) + ')';
end;

procedure TATRFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TATRFunctionForm);
end.
