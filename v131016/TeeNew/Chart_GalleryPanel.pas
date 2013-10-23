unit Chart_GalleryPanel;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, TeEngine, Series, TeeGalleryPanel, ExtCtrls, TeeProcs, Chart,
  StdCtrls;

type
  TGalleryPanelForm = class(TBaseForm)
    ChartGalleryPanel1: TChartGalleryPanel;
    Series1: TLineSeries;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ChartGalleryPanel1ChangeChart(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GalleryPanelForm: TGalleryPanelForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TGalleryPanelForm.FormCreate(Sender: TObject);
begin
  inherited;
  ChartGalleryPanel1.NumCols:=3;
  ChartGalleryPanel1.NumRows:=3;
  ChartGalleryPanel1.CreateGalleryPage('Standard');
  Series1.FillSampleValues(8);
end;

procedure TGalleryPanelForm.ChartGalleryPanel1ChangeChart(Sender: TObject);
begin
  ChangeAllSeriesType(Chart1,TChartSeriesClass(ChartGalleryPanel1.SelectedSeries.ClassType));
end;

initialization
  RegisterClass(TGalleryPanelForm);
end.
