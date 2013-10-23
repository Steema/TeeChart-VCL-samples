unit Chart_Grid;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Grids,
  {$ENDIF}
  Base, TeeChartGrid, TeeProcs, TeEngine, Chart, Series, TeCanvas,
  TeeNavigator, TeePenDlg;

type
  TChartGridForm = class(TBaseForm)
    Series1: TBarSeries;
    Panel2: TPanel;
    ChartGridNavigator1: TChartGridNavigator;
    ChartGrid1: TChartGrid;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ButtonColor1: TButtonColor;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TChartGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  ButtonColor1.LinkProperty(Series1,'SeriesColor');

  { fill series }
  Series1.Add( 32,'John');
  Series1.Add(417,'Anne');
  Series1.Add( 65,'Louise');
  Series1.Add( 87,'Jeff');

  { after adding points, we should notify the grid... }
  ChartGrid1.RecalcDimensions;
end;

procedure TChartGridForm.CheckBox1Click(Sender: TObject);
begin
  ChartGrid1.ShowLabels:=CheckBox1.Checked;
end;

procedure TChartGridForm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
     ChartGrid1.Options:=ChartGrid1.Options-[goEditing]
  else
     ChartGrid1.Options:=ChartGrid1.Options+[goEditing];

  { repaint navigator, disabling/enabling buttons }
  ChartGridNavigator1.EnableButtons;
end;

initialization
  RegisterClass(TChartGridForm);
end.
