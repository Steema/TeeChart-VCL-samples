unit Legend_CurrentPage;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeEdiGene;

type
  TLegendCurrentPage = class(TBaseForm)
    Series1: TFastLineSeries;
    ChartPageNavigator1: TChartPageNavigator;
    CheckBox1: TCheckBox;
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

procedure TLegendCurrentPage.CheckBox1Click(Sender: TObject);
begin
  Chart1.Legend.CurrentPage:=CheckBox1.Checked
end;

procedure TLegendCurrentPage.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);

  Chart1.MaxPointsPerPage:=10;
end;

initialization
  RegisterClass(TLegendCurrentPage);
end.
