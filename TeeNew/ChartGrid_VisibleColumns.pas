unit ChartGrid_VisibleColumns;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas,
  ChartGrid_AllowAppend, Grids, TeeChartGrid;

type
  TChartGridVisibleColumns = class(TChartGridAllowAppend)
    cbShowColors: TCheckBox;
    cbShowLabels: TCheckBox;
    cbShowXValues: TCheckBox;
    cbShowFields: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbShowColorsClick(Sender: TObject);
    procedure cbShowLabelsClick(Sender: TObject);
    procedure cbShowXValuesClick(Sender: TObject);
    procedure cbShowFieldsClick(Sender: TObject);
  private
    { Private declarations }
    Bar : TBarSeries;
    Point : TPointSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TChartGridVisibleColumns.FormCreate(Sender: TObject);
var i,p : integer;
begin
  inherited;

  // Create Series
  Bar:=TBarSeries.Create(self);
  Point:=TPointSeries.Create(self);

  // Settings for Chart
  with Chart1 do
  begin
    RemoveAllSeries;

    AddSeries(Bar);
    AddSeries(Point);

    Title.Visible:=False;
    Chart3DPercent:=15;
    Gradient.EndColor:=RGB(125,100,130);
    Gradient.Visible:=True;
    Legend.Alignment:=laBottom;
    Legend.Transparent:=true;
  end;

  // Setting for Series
  for i :=0 to Chart1.SeriesCount-1 do
  with Chart1[i] do
  begin
    for p:=0 to 5 do
        AddXY(p,Random(50),'Label ' + IntToStr(p));

    Pen.Visible:=False;
  end;

  // Setting for ChartGrid
  with ChartGrid1 do
  begin
    ShowColors:=True;
    ShowLabels:=True;
    ShowFields:=True;
    ShowXValues:=cgsYes;
  end;
end;

procedure TChartGridVisibleColumns.cbShowColorsClick(Sender: TObject);
begin
  ChartGrid1.ShowColors:=cbShowColors.Checked;
end;

procedure TChartGridVisibleColumns.cbShowLabelsClick(Sender: TObject);
begin
  ChartGrid1.ShowLabels:=cbShowLabels.Checked;
end;

procedure TChartGridVisibleColumns.cbShowXValuesClick(Sender: TObject);
begin
  if cbShowXValues.Checked then
     ChartGrid1.ShowXValues:=cgsYes
  else
     ChartGrid1.ShowXValues:=cgsNo;
end;

procedure TChartGridVisibleColumns.cbShowFieldsClick(Sender: TObject);
begin
  ChartGrid1.ShowFields:=cbShowFields.Checked;
end;

initialization
  RegisterClass(TChartGridVisibleColumns);
end.
