unit ChartGrid_SeriesSymbolClickable;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeChartGrid, TeeTools;

type
  TChartGridSeriesSymbolClickable = class(TBaseForm)
    cbSeriesSymbolClickable: TCheckBox;
    ChartGrid1: TChartGrid;
    Series1: TBarSeries;
    Series2: TPointSeries;
    GridBandTool1: TGridBandTool;
    procedure cbSeriesSymbolClickableClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TChartGridSeriesSymbolClickable.cbSeriesSymbolClickableClick(
  Sender: TObject);
begin
  ChartGrid1.SeriesSymbolClickable:=cbSeriesSymbolClickable.Checked;
end;

initialization
  RegisterClass(TChartGridSeriesSymbolClickable);
end.
