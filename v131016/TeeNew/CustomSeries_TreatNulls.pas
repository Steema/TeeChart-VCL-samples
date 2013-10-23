unit CustomSeries_TreatNulls;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart,
  TeePolar, TeeAntiAlias, TeePolarGrid, TeeRose, TeeWindRoseEditor;

type
  TCustomSeriesTreatNulls = class(TBaseForm)
    Label1: TLabel;
    cbSeriesType: TComboFlat;
    Label3: TLabel;
    CBNulls: TComboFlat;
    cbNullPoint: TCheckBox;
    cbFilled: TCheckBox;
    cbAntialias: TCheckBox;
    Series1: TPolarSeries;
    ChartTool1: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure cbNullPointClick(Sender: TObject);
    procedure CBNullsChange(Sender: TObject);
    procedure cbFilledClick(Sender: TObject);
    procedure cbAntialiasClick(Sender: TObject);
    procedure cbSeriesTypeChange(Sender: TObject);
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

procedure TCustomSeriesTreatNulls.cbNullPointClick(Sender: TObject);
begin
  Chart1[0].SetNull(5,cbNullPoint.Checked);
end;

procedure TCustomSeriesTreatNulls.FormCreate(Sender: TObject);
begin
  inherited;
  ColorPalettes.ApplyPalette(Chart1,10);

  Series1.GetVertAxis.AutomaticMinimum:=False;
  Series1.GetVertAxis.Minimum:=-1000;

  cbNullPoint.Checked:=True;
  cbNullPointClick(Self);
end;

procedure TCustomSeriesTreatNulls.CBNullsChange(Sender: TObject);
begin
  (Chart1[0] as TCustomPolarSeries).TreatNulls:=TTreatNullsStyle(CBNulls.ItemIndex);
end;

procedure TCustomSeriesTreatNulls.cbFilledClick(Sender: TObject);
begin
  if cbFilled.Checked then
     Chart1[0].Brush.Style:=bsSolid
  else
     Chart1[0].Brush.Style:=bsClear;
end;

procedure TCustomSeriesTreatNulls.cbAntialiasClick(Sender: TObject);
begin
  ChartTool1.Active:=cbAntialias.Checked;
end;

procedure TCustomSeriesTreatNulls.cbSeriesTypeChange(Sender: TObject);
begin
  Chart1.SeriesList.ClearValues;

  case cbSeriesType.ItemIndex of
    0: ChangeAllSeriesType(Chart1,TPolarSeries);
    1: ChangeAllSeriesType(Chart1,TRadarSeries);
    2: ChangeAllSeriesType(Chart1,TPolarBarSeries);
    3: begin
         ChangeAllSeriesType(Chart1,TPolarGridSeries);
         Chart1.SeriesList.FillSampleValues();
       end;
    4: ChangeAllSeriesType(Chart1,TWindRoseSeries);
  end;

  Chart1[0].FillSampleValues(10);

  if cbNullPoint.Checked then
     Chart1[0].SetNull(5,True);

  (Chart1[0] as TCustomPolarSeries).TreatNulls:=TTreatNullsStyle(CBNulls.ItemIndex);

  if cbFilled.Checked then
     Chart1[0].Brush.Style:=bsSolid
  else
     Chart1[0].Brush.Style:=bsClear;
end;

initialization
  RegisterClass(TCustomSeriesTreatNulls);
end.
