unit Axis_LabelsFormat;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TAxisLabelsFormat = class(TBaseForm)
    Series1: TFastLineSeries;
    procedure Chart1GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
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

procedure TAxisLabelsFormat.Chart1GetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var Num : Double;
begin
  Num:=StrToFloat(LabelText);

  if Sender=Chart1.Axes.Left then
  begin
    if Num>300 then Sender.LabelsFont.Color:=clRed
               else Sender.LabelsFont.Color:=clBlue;
  end
  else
  if Sender=Chart1.Axes.Bottom then
  begin
    if Num>12  then Sender.LabelsFont.Color:=clRed
               else Sender.LabelsFont.Color:=clBlue;
  end;
end;

initialization
  RegisterClass(TAxisLabelsFormat);
end.
