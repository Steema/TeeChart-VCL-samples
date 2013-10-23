unit Function_MovAveWeighted;
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
  Base, TeEngine, StatChar, Series, TeeProcs, Chart;

type
  TMovAveWeightedForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TFastLineSeries;
    MovingAverageFunction1: TMovingAverageFunction;
    Series2: TFastLineSeries;
    procedure CheckBox1Click(Sender: TObject);
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

procedure TMovAveWeightedForm.CheckBox1Click(Sender: TObject);
begin
  MovingAverageFunction1.Weighted:=CheckBox1.Checked;
end;

procedure TMovAveWeightedForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);
end;

initialization
  RegisterClass(TMovAveWeightedForm);
end.
