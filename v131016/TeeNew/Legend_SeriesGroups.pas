unit Legend_SeriesGroups;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeEdit;

type
  TLegendSeriesGroups = class(TBaseForm)
    Label1: TLabel;
    CBLegendStyle: TComboFlat;
    bEdit: TButton;
    ChartEditor1: TChartEditor;
    ComboFlat1: TComboFlat;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure CBLegendStyleChange(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
  private
    { Private declarations }
    bar1,bar2,bar3,bar4 : TBarSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeEditCha;

procedure TLegendSeriesGroups.FormCreate(Sender: TObject);
var i : integer;
begin
  inherited;

  // Series Creation
  bar1 := TBarSeries.Create(Self);
  bar2 := TBarSeries.Create(Self);
  bar3 := TBarSeries.Create(Self);
  bar4 := TBarSeries.Create(Self);

  with Chart1 do
  begin

    // Add Series to the Chart
    AddSeries(bar1);
    AddSeries(bar2);
    AddSeries(bar3);
    AddSeries(bar4);

    // Creating Groups
    with SeriesGroups do
    begin
      Chart1.SeriesList.AddGroup('Group A');
      Items[0].Add( Chart1[0] );
      Items[0].Add( Chart1[2] );

      Chart1.SeriesList.AddGroup('Group B');
      Items[1].Add( Chart1[1] );
      Items[1].Add( Chart1[3] );
    end;

    // Legend Settings
    with Legend do
    begin
      LegendStyle:=lsSeriesGroups;
      Font.Size:=18;
    end;
  end;

  // Sample values to the Serie
  for i:=0 to Chart1.SeriesCount-1 do
      Chart1[i].FillSampleValues(3);

  CBLegendStyle.ItemIndex:=4;

  Chart1.Legend.CheckBoxes:=True;
end;

procedure TLegendSeriesGroups.bEditClick(Sender: TObject);
begin
  // Enable showing Series Groups at editor dialog:
  ChartEditor1.Options:=ChartEditor1.Options+[ceGroups];
  ChartEditor1.TreeView:=True;
  
  // Show chart editor dialog
  ChartEditor1.Execute;
end;

procedure TLegendSeriesGroups.CBLegendStyleChange(Sender: TObject);
begin
  Chart1.Legend.LegendStyle:=TLegendStyle(CBLegendStyle.ItemIndex);
end;

procedure TLegendSeriesGroups.ComboFlat1Change(Sender: TObject);
begin
  Chart1.Legend.CheckBoxes:= ComboFlat1.ItemIndex <> 0;

  if ComboFlat1.ItemIndex=1 then
     Chart1.Legend.CheckBoxesStyle:=cbsCheck
  else
  if ComboFlat1.ItemIndex=2 then
     Chart1.Legend.CheckBoxesStyle:=cbsRadio;
end;

initialization
  RegisterClass(TLegendSeriesGroups);
end.

