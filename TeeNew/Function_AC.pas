unit Function_AC;
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
  TACFunctionForm = class(TBaseForm)
    Series1: TCandleSeries;
    Button1: TButton;
    Series2: TVolumeSeries;
    TeeFunction1: TACFunction;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ACFunctionForm: TACFunctionForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TACFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

procedure TACFunctionForm.Button1Click(Sender: TObject);
begin
  Series1.FillSampleValues(200);
end;

initialization
  RegisterClass(TACFunctionForm);
end.
