unit ChartEditor_PageNum;
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
  TChartEditorPageNum = class(TBaseForm)
    Button1: TButton;
    Series1: TBarSeries;
    ChartPageNavigator1: TChartPageNavigator;
    procedure Button1Click(Sender: TObject);
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

Uses EditChar, TeeEditCha;

procedure TChartEditorPageNum.Button1Click(Sender: TObject);
begin
  { show the Chart editor, starting at Paging tab... }
  EditChartPage(Self, Chart1, teeEditPagingPage);
end;

procedure TChartEditorPageNum.FormCreate(Sender: TObject);
begin
  inherited;

  { fill 20 values... }
  Series1.FillSampleValues(20);
  Series1.ColorEachPoint:=True;

  { divide chart in 4 pages, 5 points per page }
  Chart1.MaxPointsPerPage:=5;
end;

initialization
  RegisterClass(TChartEditorPageNum);
end.
