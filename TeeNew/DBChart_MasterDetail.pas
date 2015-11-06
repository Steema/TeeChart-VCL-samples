unit DBChart_MasterDetail;
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
  Base_DBChart, Db, TeeProcs, TeEngine, Chart, Series, DBChart, TeeGDIPlus;

type
  TLinkedTablesForm = class(TForm)
    DBChart1: TDBChart;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Table1: TTable;
    Table2: TTable;
    DBNavigator1: TDBNavigator;
    DataSource2: TDataSource;
    Table2OrderNo: TFloatField;
    Table2CustNo: TFloatField;
    Table2SaleDate: TDateTimeField;
    Table2AmountPaid: TCurrencyField;
    Table1CustNo: TFloatField;
    Table1Company: TStringField;
    AreaSeries1: TAreaSeries;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TLinkedTablesForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 { Force DBChart to refresh the detail records
   when the master record changes. }
  DBChart1.CheckDataSource(AreaSeries1);
end;

procedure TLinkedTablesForm.CheckBox1Click(Sender: TObject);
begin
  CheckTable(Table1);
  CheckTable(Table2);
  Table1.Active:=CheckBox1.Checked;
  Table2.Active:=CheckBox1.Checked;
end;

procedure TLinkedTablesForm.FormShow(Sender: TObject);
begin
  DBGrid1.BorderStyle:=bsNone;
  DBGrid2.BorderStyle:=bsNone;
end;

initialization
  RegisterClass(TLinkedTablesForm);
end.
