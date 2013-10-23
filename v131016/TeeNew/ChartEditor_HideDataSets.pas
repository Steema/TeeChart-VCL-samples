unit ChartEditor_HideDataSets;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  DB, DBTables,
  Base, TeeProcs, TeEngine, Chart, DBChart, EditChar, Series;

type
  // New class to hide datasets at editor dialog
  TMyChart=class(TDBChart)
  public
    HideTable:TDataSet;

    Function IsValidDataSource(ASeries: TChartSeries;
                           AComponent: TComponent):Boolean; override;
  end;

  TChartEditorHideDataSets = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Table1: TTable;
    Table2: TTable;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    MyChart : TMyChart;  // <--- variable
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TMyChart }

// This function should return TRUE when AComponent is a valid
// source for ASeries.
// Returning FALSE will not add AComponent at Chart Editor dialog.
//
// It can be useful to return FALSE to hide tables or datasets from
// Series DataSource dialog.
//
function TMyChart.IsValidDataSource(ASeries: TChartSeries;
  AComponent: TComponent): Boolean;
begin
  result:=inherited IsValidDataSource(ASeries,AComponent);
  if result and Assigned(HideTable) then
     result:=AComponent<>HideTable;
end;

// Example of use:
procedure TChartEditorHideDataSets.FormCreate(Sender: TObject);
begin
  inherited;

  // Create "MyChart"
  MyChart:=TMyChart.Create(Self);
  MyChart.Parent:=Self;
  MyChart.Align:=alClient;

  // Add one Bar series
  MyChart.AddSeries(TBarSeries);
  MyChart[0].DataSource:=Table2;

  // Tell "MyChart" to hide Table1 dataset
  MyChart.HideTable:=Table1;
end;

procedure TChartEditorHideDataSets.CheckBox1Click(Sender: TObject);
begin
  // just an example of using "MyChart" to specify hidden components at editor
  if CheckBox1.Checked then
     MyChart.HideTable:=Table1
  else
     MyChart.HideTable:=nil;
end;

procedure TChartEditorHideDataSets.Button1Click(Sender: TObject);
begin
  // Show chart editor dialog, positioned at series datasource tab
  // for the first MyChart series
  EditSeriesDataSource(Self,MyChart[0]);
end;

initialization
  RegisterClass(TChartEditorHideDataSets);
end.
