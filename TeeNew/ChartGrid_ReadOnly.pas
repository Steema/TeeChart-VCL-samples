unit ChartGrid_ReadOnly;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas,
  ChartGrid_AllowAppend, TeeChartGrid;

type
  TChartGridReadOnly = class(TChartGridAllowAppend)
    cbReadOnly: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbReadOnlyClick(Sender: TObject);
  private
    { Private declarations }
    PieSeries : TPieSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeThemes;

procedure TChartGridReadOnly.FormCreate(Sender: TObject);
begin
  inherited;

  PieSeries:=TPieSeries.Create(self);

  With Chart1 do
  begin
    RemoveAllSeries;
    Chart1.AddSeries(PieSeries);
    Legend.Visible:=false;
  end;

  ApplyChartTheme(TExcelTheme,Chart1,3);

  with PieSeries do
  begin
    FillSampleValues();
    ColorEachPoint:=true;
    ExplodeBiggest:=25;
    Marks.ArrowLength:=30;
    Marks.Arrow.Color:=clBlack;
  end;

  With ChartGrid1 do
  begin
    ReadOnly:=true;
    ShowColors:=true;
  end;
end;

procedure TChartGridReadOnly.cbReadOnlyClick(Sender: TObject);
begin
  ChartGrid1.ReadOnly:=cbReadOnly.Checked;
end;

initialization
  RegisterClass(TChartGridReadOnly);
end.

