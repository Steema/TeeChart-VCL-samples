unit ChartGrid_AllowInsertSeries;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, ChartGrid_AllowAppend,
  TeeChartGrid;

type
  TChartGridAllowInsertSeries = class(TChartGridAllowAppend)
    cbAllowInsertSeries: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbAllowInsertSeriesClick(Sender: TObject);
  private
    { Private declarations }
    LineSeries : TLineSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TChartGridAllowInsertSeries.FormCreate(Sender: TObject);
begin
  inherited;

  LineSeries:=TLineSeries.Create(self);

  with Chart1 do
  begin
    RemoveAllSeries;
    AddSeries(LineSeries);

    Chart3DPercent:=30;
    Gradient.EndColor:=clDkGray;
    Gradient.Visible:=true;
  end;

  with LineSeries do
  begin
    FillSampleValues(10);
    Pen.Visible:=false;
    Gradient.Visible:=true;
  end;

  with ChartGrid1 do
  begin
    AllowInsertSeries:=True;
    ShowLabels:=False;

    Hint:='KeyRight to insert Series';
  end;
end;

procedure TChartGridAllowInsertSeries.cbAllowInsertSeriesClick(
  Sender: TObject);
begin
  ChartGrid1.AllowInsertSeries:=cbAllowInsertSeries.Checked;
end;

initialization
  RegisterClass(TChartGridAllowInsertSeries);
end.

