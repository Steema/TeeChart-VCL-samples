unit Function_AO;
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
  TAOFunctionForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TVolumeSeries;
    TeeFunction1: TAOFunction;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AOFunctionForm: TAOFunctionForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAOFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

procedure TAOFunctionForm.Button1Click(Sender: TObject);
begin
  Series1.FillSampleValues(200);
end;

initialization
  RegisterClass(TAOFunctionForm);
end.
