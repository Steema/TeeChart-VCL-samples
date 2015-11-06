unit DBChart_LocateRecord;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons, QGrids, QDBGrids, QDBCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons, Grids, DBGrids, DBCtrls, DBTables,
  {$ENDIF}
  Db, BDE,
  Base_DBChart, TeeProcs, TeEngine, Chart, DBChart, Series;

type
  TDBChartRecordLocate = class(TBaseDBChart)
    Table1: TTable;
    Series1: TBarSeries;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    CheckBox1: TCheckBox;
    Table1NAME: TStringField;
    Table1SIZE: TSmallintField;
    Splitter1: TSplitter;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBChart1ClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Series1AfterAdd(Sender: TChartSeries; ValueIndex: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    BookMarks:Array of TBookMark;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TDBChartRecordLocate.CheckBox1Click(Sender: TObject);
begin
  Table1.Active:=CheckBox1.Checked;  { open - close the table }
end;

procedure TDBChartRecordLocate.FormShow(Sender: TObject);
begin
  inherited;
  CheckTable(Table1);  { set the Database (dbdemos or bddemos) }
end;

{ when clicking a point, go to the associated record in Table1 }
procedure TDBChartRecordLocate.DBChart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // Use the bookmarks to find the database record for the clicked point...
  Table1.GotoBookmark(BookMarks[ValueIndex]);
end;

{ After adding a series point, store the table record bookmark }
procedure TDBChartRecordLocate.Series1AfterAdd(Sender: TChartSeries;
  ValueIndex: Integer);
begin
  // Associate a new Bookmark to every point added to Series1...
  if Length(Bookmarks)<ValueIndex+1 then SetLength(Bookmarks,1+ValueIndex);
  Bookmarks[ValueIndex]:=Table1.GetBookMark;
end;

{ cleanup memory }
procedure TDBChartRecordLocate.FormDestroy(Sender: TObject);
var t:Integer;
begin
  // Free the previously allocated bookmarks...
  for t:=Low(Bookmarks) to High(Bookmarks) do
       Table1.FreeBookMark(Bookmarks[t]);
  Bookmarks:=nil;
end;

procedure TDBChartRecordLocate.DataSource1DataChange(Sender: TObject;
  Field: TField);
var t : Integer;
    tmp : TBookmark;
begin
  inherited;

  tmp:=Table1.GetBookmark;

  for t:=0 to Length(BookMarks)-1 do
  if Table1.CompareBookmarks(tmp,BookMarks[t])=CMPEql then
     Series1.Marks[t].Font.Style:=[fsBold]
  else
     Series1.Marks[t].Font.Style:=[];

  Table1.FreeBookmark(tmp);
end;

initialization
  RegisterClass(TDBChartRecordLocate);
end.

