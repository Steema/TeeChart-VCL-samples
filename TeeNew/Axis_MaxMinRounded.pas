unit Axis_MaxMinRounded;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TAxisMaxMinRoundedForm = class(TBaseForm)
    Label2: TLabel;
    cbAxis: TComboFlat;
    cbRoundMax: TCheckBox;
    Series1: TFastLineSeries;
    cbRoundMin: TCheckBox;
    procedure cbAxisChange(Sender: TObject);
    procedure cbRoundMaxClick(Sender: TObject);
    procedure cbRoundMinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function TheAxis:TChartAxis;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

function TAxisMaxMinRoundedForm.TheAxis:TChartAxis;
begin
  if cbAxis.ItemIndex=0 then result:=Chart1.Axes.Left
                        else result:=Chart1.Axes.Bottom;
end;

procedure TAxisMaxMinRoundedForm.cbAxisChange(Sender: TObject);
begin
  cbRoundMax.Checked:=TheAxis.MaximumRound;
  cbRoundMin.Checked:=TheAxis.MinimumRound;
end;

procedure TAxisMaxMinRoundedForm.cbRoundMaxClick(Sender: TObject);
begin
  TheAxis.MaximumRound:=cbRoundMax.Checked;
end;

procedure TAxisMaxMinRoundedForm.cbRoundMinClick(Sender: TObject);
begin
  TheAxis.MinimumRound:=cbRoundMin.Checked;
end;

procedure TAxisMaxMinRoundedForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);
end;

initialization
  RegisterClass(TAxisMaxMinRoundedForm);
end.
