unit SeriesType_OrgChart;
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
  Base, TeCanvas, TeePenDlg, TeEngine, Series, CandleCh, TeeProcs, Chart,
  TeeOrgSeries;

type
  TSeriesTypeOrgChart = class(TBaseForm)
    Button1: TButton;
    Series1: TOrgSeries;
    ComboFlat1: TComboFlat;
    procedure Button1Click(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
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

Uses
  EditChar;

procedure TSeriesTypeOrgChart.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TSeriesTypeOrgChart.ComboFlat1Change(Sender: TObject);
begin
  Series1.LineStyle:=TOrgLineStyle(ComboFlat1.ItemIndex);
end;

procedure TSeriesTypeOrgChart.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TSeriesTypeOrgChart);
end.
