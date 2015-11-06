unit GridToChart_Demo;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QGrids, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, Grids, StdCtrls, ExtCtrls,
  {$ENDIF}
  TeeProcs, TeEngine, Chart, Series, TeeTools, TeeDragPoint;

type
  TGridToChartDemo = class(TForm)
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Splitter1: TSplitter;
    Chart1: TChart;
    ChartTool1: TDragPointTool;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure ChartTool1DragPoint(Sender: TDragPointTool; Index: Integer);
    procedure Chart1ClickLegend(Sender: TCustomChart; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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

// Creates Series and fills them with data from Grid parameter.
// "SeriesClass" parameter specifies chart style.
procedure GridToChart(Grid:TStringGrid; Chart:TCustomChart; SeriesClass:TChartSeriesClass=nil);
var tmp : TChartSeries;
    tmpCol, tmpRow : Integer;
begin
  if SeriesClass=nil then SeriesClass:=TBarSeries;
  Chart.FreeAllSeries;

  with Grid do
  begin
    for tmpCol:=ColCount-1 downto 1 do
    begin
      tmp:=SeriesClass.Create(nil);
      with tmp do
      begin
        Title:=Cells[tmpCol,0];
        Marks.Visible:=False;
        Marks.Style:=smsValue;
        Pen.Visible:=False;
        ParentChart:=Chart;
      end;

      for tmpRow:=1 to RowCount-1 do
          tmp.Add(StrToFloat(Cells[tmpCol,tmpRow]),Cells[0,tmpRow]);
    end;
  end;
end;

procedure TGridToChartDemo.FormCreate(Sender: TObject);
var t : Integer;
    Continent : Integer;
    Month     : Integer;
begin
  // Fill grid with sample data...
  with StringGrid1 do
  begin
    RowCount:=13;
    ColCount:=4;

    for t:=1 to 12 do
        Cells[0,t]:={$IFDEF D15}FormatSettings.{$ENDIF}ShortMonthNames[t];

    Cells[1,0]:='Africa';
    Cells[2,0]:='America';
    Cells[3,0]:='Asia';

    for Continent:=1 to 3 do
        for Month:=1 to 12 do
            Cells[Continent,Month]:=IntToStr(Random(1000));
  end;


  // Fill chart with grid
  GridToChart(StringGrid1,Chart1);

  // Cosmetic change:
  if Chart1.SeriesCount>0 then
     (Chart1[0] as TBarSeries).MultiBar:=mbNone;

  Chart1.Legend.Inverted:=True;
end;

// This grid event is used to change chart when grid cell is edited.
procedure TGridToChartDemo.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var Series : TChartSeries;
begin
  if Showing then
  begin
    Series:=Chart1[StringGrid1.ColCount-ACol-1];
    Series.MandatoryValueList[ARow-1]:=StrToFloatDef(StringGrid1.Cells[ACol,ARow],0);
    Series.Repaint;
  end;
end;

procedure TGridToChartDemo.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var t : Integer;
begin
  ChartTool1.Series:=Series;
  // Hide all series marks
  for t:=0 to Chart1.SeriesCount-1 do Chart1[t].Marks.Visible:=False;

  // show clicked series marks
  Series.Marks.Visible:=True;
end;

// When a chart point is dragged, change StringGrid cell text...
procedure TGridToChartDemo.ChartTool1DragPoint(Sender: TDragPointTool;
  Index: Integer);
var ACol, ARow:Integer;
begin
  if StringGrid1.EditorMode then StringGrid1.EditorMode:=False;

  ACol:=StringGrid1.ColCount-Chart1.SeriesList.IndexOf(Sender.Series)-1;
  ARow:=Index+1;

  StringGrid1.Cells[ACol,ARow]:=FloatToStr(Round(Sender.Series.MandatoryValueList[ARow-1]));
  StringGrid1.Repaint;
end;

procedure TGridToChartDemo.Chart1ClickLegend(Sender: TCustomChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Sender.Legend.Inverted:=not Sender.Legend.Inverted;
end;

initialization
  RegisterClass(TGridToChartDemo);
end.
