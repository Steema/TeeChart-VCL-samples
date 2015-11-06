unit Function_SAR;
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
  Base, TeEngine, Series, TeeProcs, Chart, CandleCh, TeeSAR, OHLChart;
  

type
  TSARFunctionForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TLineSeries;
    TeeFunction1: TSARFunction;
    Label1: TLabel;
    Edit1: TEdit;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
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

procedure TSARFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;

  Edit1.Text:=FloatToStr(TeeFunction1.AccelerationFactor);
  TrackBar1.Position:=Round(TeeFunction1.AccelerationFactor*100);
end;

procedure TSARFunctionForm.Edit1Change(Sender: TObject);
begin
  with TeeFunction1 do
       AccelerationFactor:=StrToFloatDef(Edit1.Text,AccelerationFactor);
end;

procedure TSARFunctionForm.TrackBar1Change(Sender: TObject);
begin
  Edit1.Text:=FloatToStr(TrackBar1.Position*0.01);
end;

procedure TSARFunctionForm.TrackBar2Change(Sender: TObject);
begin
  TeeFunction1.MaxStep:=TrackBar2.Position*0.01;
end;

initialization
  RegisterClass(TSARFunctionForm);
end.
