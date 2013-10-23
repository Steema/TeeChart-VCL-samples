unit PrintPreview_Navigate;
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
  Print_Preview, TeEngine, Series, StatChar, TeeEdiGene, TeePreviewPanel,
  TeeProcs, Chart;

type
  TPrintPreviewNavigate = class(TPrintPreviewForm)
    ChartPageNavigator1: TChartPageNavigator;
    Series1: THistogramSeries;
    procedure Chart1PageChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TPrintPreviewNavigate.Chart1PageChange(Sender: TObject);
begin
  { after changing the current page, refresh the Print Preview }
  TeePreviewPanel1.Repaint;
end;

procedure TPrintPreviewNavigate.FormShow(Sender: TObject);
begin
  inherited;
  { after adding points to Series1 refresh the navigator buttons }
  Series1.FillSampleValues(20);
  ChartPageNavigator1.EnableButtons;
end;

initialization
  RegisterClass(TPrintPreviewNavigate);
end.
