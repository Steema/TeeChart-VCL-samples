unit Gallery_Panel;
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
  Base, TeeGalleryPanel, TeeProcs, TeEngine, Chart, Series;

type
  TGalleryPanelForm = class(TBaseForm)
    ChartGalleryPanel1: TChartGalleryPanel;
    Label1: TLabel;
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ChartGalleryPanel1ChangeChart(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TGalleryPanelForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);

  With ChartGalleryPanel1 do
  begin
    NumCols:=2;
    NumRows:=3;
    CreateChartList([TLineSeries,TBarSeries,TAreaSeries,TPieSeries]);
  end;

  CheckBox1.Checked:=ChartGalleryPanel1.DefaultSmooth;
end;

procedure TGalleryPanelForm.ChartGalleryPanel1ChangeChart(Sender: TObject);
var tmpSeries : TChartSeries;
begin
  tmpSeries:=ChartGalleryPanel1.SelectedChart[0];
  Label1.Caption:=GetGallerySeriesName(tmpSeries);
  ChangeAllSeriesType(Chart1,TChartSeriesClass(tmpSeries.ClassType));
  
end;

procedure TGalleryPanelForm.CheckBox1Click(Sender: TObject);
begin
  ChartGalleryPanel1.Smooth:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TGalleryPanelForm);
end.
