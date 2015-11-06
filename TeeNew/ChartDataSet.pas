unit ChartDataSet;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QGrids, QDBGrids,  
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids,
  {$ENDIF}
  Base, Db, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeData;

type
  TChartDataSetDemo = class(TBaseForm)
    DataSource1: TDataSource;
    ChartDataSet1: TChartDataSet;
    DBGrid1: TDBGrid;
    cbActive: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
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

procedure TChartDataSetDemo.FormCreate(Sender: TObject);
var tmp : TChartSeries;
begin
  inherited;

  // Create a sample series
  tmp:=TBarSeries.Create(Self);
  tmp.ParentChart:=Chart1;
  Chart1.SeriesList.AddGroup('Group 1').Add(tmp);
  tmp.FillSampleValues(5);
  tmp.XLabel[3]:='Sample text';

  // Create another sample series
  tmp:=TBarSeries.Create(Self);
  tmp.ParentChart:=Chart1;
  Chart1.SeriesList.AddGroup('Group 2').Add(tmp);
  tmp.FillSampleValues(8);

  Chart1.Legend.LegendStyle:=lsSeriesGroups;

  // Create dataset and associate it to Chart1
  ChartDataSet1:=TChartDataSet.Create(Self);
  ChartDataSet1.Chart:=Chart1;

  // Set dataset to Grid
  DataSource1.DataSet:=ChartDataSet1;
  ChartDataSet1.Open;
end;

procedure TChartDataSetDemo.cbActiveClick(Sender: TObject);
begin
  ChartDataSet1.Active:=cbActive.Checked;
end;

initialization
  RegisterClass(TChartDataSetDemo);
end.
