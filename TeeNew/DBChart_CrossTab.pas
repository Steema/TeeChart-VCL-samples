{********************************************}
{    TeeChart. DBChart CrossTabs             }
{ Copyright (c) 1995-2019 by Steema Software }
{    All Rights Reserved                     }
{********************************************}
unit DBChart_CrossTab;
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
  Base_DBChart, Db, TeeProcs, TeEngine, Chart, Series, TeeGDIPlus;

type
  TDBChartCrossTab = class(TForm)
    DataSource1: TDataSource;
    Chart1: TChart;
    Series1: TBarSeries;
    Table1: TTable;
    Table1OrderNo: TFloatField;
    Table1ShipVIA: TStringField;
    Table1Terms: TStringField;
    Table1AmountPaid: TCurrencyField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Dimension1 : String;
    Dimension2 : String;
    Procedure CrossTab;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{ Include the TeeCross unit }

uses TeeDBCrosstab;

{ refresh the Chart showing the "sum" or the "count"... }
procedure TDBChartCrossTab.RadioGroup1Click(Sender: TObject);
begin
  CrossTab;
end;

procedure TDBChartCrossTab.FormCreate(Sender: TObject);
begin
  DBGrid1.BorderStyle:=bsNone; // CLR

  Dimension1:='Terms';
  Dimension2:='ShipVia';
end;

{ swap the cross-tab fields and refresh... }
procedure TDBChartCrossTab.Button1Click(Sender: TObject);
var tmp : String;
begin
  tmp        := Dimension1;
  Dimension1 := Dimension2;
  Dimension2 := tmp;

  CrossTab;
end;

Procedure TDBChartCrossTab.CrossTab;
var Summary : TGroupFormula;
begin
  if RadioGroup1.ItemIndex=0 then Summary:=gfCount
                             else Summary:=gfSum;

  FillDataSet(Table1,Series1,Dimension1,Dimension2,'AmountPaid',Summary);
end;

procedure TDBChartCrossTab.CheckBox1Click(Sender: TObject);
begin
  Table1.Open;
  RadioGroup1.Enabled:=True;
  Button1.Enabled:=True;
  CrossTab;
end;

procedure TDBChartCrossTab.FormShow(Sender: TObject);
begin
  CheckTable(Table1);
end;

initialization
  RegisterClass(TDBChartCrossTab);
end.
