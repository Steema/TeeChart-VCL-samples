unit ChartEditor_Dialog;
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
  Base, TeeEdit, TeeProcs, TeEngine, Chart, Series;

type
  TChartEditorForm = class(TBaseForm)
    ChartEditor1: TChartEditor;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Series1: THorizBarSeries;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

Uses TeeEditCha;

procedure TChartEditorForm.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute
end;

procedure TChartEditorForm.CheckBox1Click(Sender: TObject);
Var NewTabs : TChartEditorHiddenTabs;
begin
  NewTabs:=[cetTools,cetExport,cetPrintPreview,cetSeriesData];
  if CheckBox1.Checked then
     ChartEditor1.HideTabs:=ChartEditor1.HideTabs-NewTabs
  else
     ChartEditor1.HideTabs:=ChartEditor1.HideTabs+NewTabs
end;

procedure TChartEditorForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

initialization
  RegisterClass(TChartEditorForm);
end.
