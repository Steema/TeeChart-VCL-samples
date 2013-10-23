unit Function_Alligator;
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
  TAlligatorFunctionForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TLineSeries;
    TeeFunction1: TAlligatorFunction;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlligatorFunctionForm: TAlligatorFunctionForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAlligatorFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

procedure TAlligatorFunctionForm.Button1Click(Sender: TObject);
begin
  Series1.FillSampleValues(300);
end;

initialization
  RegisterClass(TAlligatorFunctionForm);
end.
