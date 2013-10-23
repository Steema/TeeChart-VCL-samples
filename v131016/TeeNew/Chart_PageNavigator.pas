unit Chart_PageNavigator;
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
  Base, Chart, TeEngine, Series, TeeProcs, TeeEdiGene, TeeNavigator;

type
  TPageNavigatorForm = class(TBaseForm)
    Series1: TFastLineSeries;
    ChartPageNavigator1: TChartPageNavigator;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Chart1PageChange(Sender: TObject);
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

procedure TPageNavigatorForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(1000);
  Chart1.MaxPointsPerPage:=50;     { number of pages: 1000 / 50 = 20 }
end;

procedure TPageNavigatorForm.Chart1PageChange(Sender: TObject);
begin
  Label2.Caption:=IntToStr(Chart1.Page)+' of '+IntToStr(Chart1.NumPages);
end;

initialization
  RegisterClass(TPageNavigatorForm);
end.
