unit Series_DataSet;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons, QGrids, QDBGrids, QDBCtrls, Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons, Grids, DBGrids, DBCtrls,
  {$ENDIF}
  Base, Db, TeeProcs, TeEngine, Chart, TeeSurfa, TeeData, TeeTools, DBChart,
  TeePenDlg;

type
  TSeriesDataSetForm = class(TBaseForm)
    Series1: TSurfaceSeries;
    SeriesDataSet1: TSeriesDataSet;
    DataSource1: TDataSource;
    SeriesDataSet1Color: TIntegerField;
    SeriesDataSet1X: TFloatField;
    SeriesDataSet1Y: TFloatField;
    SeriesDataSet1Label: TStringField;
    SeriesDataSet1Z: TFloatField;
    CheckBox1: TCheckBox;
    ChartTool1: TRotateTool;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
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

Uses TeCanvas;

procedure TSeriesDataSetForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if DataCol=0 then
  With DBGrid1.Canvas do
  begin
    Brush.Color:=Column.Field.AsInteger;
    FillRect(Rect);
  end;
end;

procedure TSeriesDataSetForm.CheckBox1Click(Sender: TObject);
begin
  SeriesDataSet1.Active:=CheckBox1.Checked;
end;

procedure TSeriesDataSetForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TSeriesDataSetForm.DBGrid1EditButtonClick(Sender: TObject);
begin
  SeriesDataSet1Color.AsInteger:=EditColor(Self,SeriesDataSet1Color.AsInteger);
end;

initialization
  RegisterClass(TSeriesDataSetForm);
end.
