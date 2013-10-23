unit DBChart_Summary;
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
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBTables,
  {$ENDIF}
  Base_DBChart, DB, TeeProcs, TeEngine, Chart, Series, DBChart;

type
  TDBChartSummary = class(TBaseDBChart)
    Button1: TButton;
    Series1: TBarSeries;
    Table1: TTable;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
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

Uses TeeDBSumEdit;

procedure TDBChartSummary.Button1Click(Sender: TObject);
begin
  TeeDBSummaryEditor(Self,Series1);
end;

procedure TDBChartSummary.ComboBox1Change(Sender: TObject);
begin
  // Change the grouping field...
  Case ComboBox1.ItemIndex of
    0: Series1.XLabelsSource:='EmpNo';
    1: Series1.XLabelsSource:='PaymentMethod';
    2: Series1.XLabelsSource:='#Year#SaleDate';
    3: Series1.XLabelsSource:='ShipVia';
    4: Series1.XLabelsSource:='Terms';
  end;

  // Set a different color for each selected grouping field
  Series1.SeriesColor:=GetDefaultColor(ComboBox1.ItemIndex);
end;

procedure TDBChartSummary.ComboBox2Change(Sender: TObject);
begin
  // Change the aggregation ( sum, count, etc... )
  Case ComboBox2.ItemIndex of
    0: Series1.YValues.ValueSource:='#Sum#AmountPaid';
    1: Series1.YValues.ValueSource:='#Count#AmountPaid';
    2: Series1.YValues.ValueSource:='#High#AmountPaid';
    3: Series1.YValues.ValueSource:='#Low#AmountPaid';
    4: Series1.YValues.ValueSource:='#Avg#AmountPaid';
  end;
end;

procedure TDBChartSummary.CheckBox1Click(Sender: TObject);
begin
  CheckTable(Table1);

  // Open - close the table
  Table1.Active:=CheckBox1.Checked;
end;

procedure TDBChartSummary.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=3;
  ComboBox2.ItemIndex:=0;
end;

initialization
  RegisterClass(TDBChartSummary);
end.
