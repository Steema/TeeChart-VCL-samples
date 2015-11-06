unit ChartGalleryPanel_Charts;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeGalleryPanel,
  TeeGDIPlus;

type
  TChartGallerypanelCharts = class(TBaseForm)
    ChartGalleryPanel1: TChartGalleryPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ChartGalleryPanel1SelectedChart(Sender: TObject);
    procedure ChartGalleryPanel1ChangeChart(Sender: TObject);
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

uses
  TeeThemes, TeeConst;

procedure TChartGallerypanelCharts.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;

  clTeeGallery:=clRed;

  {$IFDEF D10}
  // (This fails in Delphi 8 "BDS 2.0" and Delphi 2005 "BDS 3.0")

  TeeColorPalette[clTeeGallery1]:=RGB(0,255,220);
  TeeColorPalette[clTeeGallery2]:=RGB(0,255,100);
  {$ENDIF}

  ChartGalleryPanel1.CreateGalleryPage('Standard');

  for t:=0 to ChartGalleryPanel1.Charts.Count-1 do
  begin
    with ChartGalleryPanel1.Charts[t] do
    begin
      Gradient.Visible:=True;
      Gradient.StartColor:=RGB(0,255,220);
      Gradient.EndColor:=clWhite;
    end;

    ApplyChartTheme(TFactsTheme,ChartGalleryPanel1.Charts[t]);
  end;
end;

procedure TChartGallerypanelCharts.ChartGalleryPanel1SelectedChart(
  Sender: TObject);
var tmp : Integer;
begin
  tmp:=ChartGalleryPanel1.SelectedChart.Tag;

  Label1.Caption:='Selected : '+ChartGalleryPanel1.SelectedChart[0].ClassName+
             '     SubIndex : '+IntToStr(tmp);
end;

procedure TChartGallerypanelCharts.ChartGalleryPanel1ChangeChart(
  Sender: TObject);
var tmp : Integer;
begin
  tmp:=ChartGalleryPanel1.SelectedChart.Tag;

  Label1.Caption:='Changed : '+ChartGalleryPanel1.SelectedChart[0].ClassName+
             '     SubIndex : '+IntToStr(tmp);
end;

initialization
  RegisterClass(TChartGallerypanelCharts);
end.
