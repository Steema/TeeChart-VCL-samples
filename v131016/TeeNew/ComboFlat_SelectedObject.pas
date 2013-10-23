unit ComboFlat_SelectedObject;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TComboFlatSelectedObject = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TBarSeries;
    Series3: TAreaSeries;
    Series4: TPointSeries;
    Series5: TPieSeries;
    cbSeries: TComboFlat;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbSeriesChange(Sender: TObject);
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

procedure TComboFlatSelectedObject.FormCreate(Sender: TObject);
var t : integer;
begin
  inherited;

  with Chart1 do
       for t:=0 to Chart1.SeriesCount-1 do
           cbSeries.Items.AddObject(SeriesTitleOrName(Series[t]), Series[t]);

  cbSeries.ItemIndex:=0;
  cbSeriesChange(self);
end;

procedure TComboFlatSelectedObject.cbSeriesChange(Sender: TObject);
var t : integer;
begin
  for t:=0 to Chart1.SeriesCount-1 do
      Chart1[t].Active:=False;

  TChartSeries(cbSeries.SelectedObject).Active:=True;
end;

initialization
  RegisterClass(TComboFlatSelectedObject);
end.

