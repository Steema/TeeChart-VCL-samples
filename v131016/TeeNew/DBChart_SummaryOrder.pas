unit DBChart_SummaryOrder;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base_DBChart, TeeProcs, TeEngine, Chart, DBChart, TeCanvas, DB, DBTables,
  Series;

type
  TDBSummaryOrder = class(TBaseDBChart)
    CheckBox1: TCheckBox;
    Button1: TButton;
    Series1: THorizBarSeries;
    Table1: TTable;
    Label1: TLabel;
    ComboFlat1: TComboFlat;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

Uses TeeDBSumEdit;

procedure TDBSummaryOrder.Button1Click(Sender: TObject);
begin
  TeeDBSummaryEditor(Self,Series1);
end;

procedure TDBSummaryOrder.CheckBox1Click(Sender: TObject);
begin
  CheckTable(Table1);

  // Open - close the table
  Table1.Active:=CheckBox1.Checked;
end;

procedure TDBSummaryOrder.ComboFlat1Change(Sender: TObject);
begin
  Table1.Close;

  case ComboFlat1.ItemIndex of
    0: begin
         Series1.XLabelsSource:='Pay_Method';
         Series1.XValues.Order:=loNone;
       end;
    1: begin
         Series1.XLabelsSource:='Pay_Method';
         Series1.XValues.Order:=loAscending;
       end;
    2: begin
         Series1.XLabelsSource:='#SORTDES#Pay_Method';
         Series1.XValues.Order:=loNone;
       end;
  end;

  Table1.Open;

  CheckBox1.Checked:=True;
end;

procedure TDBSummaryOrder.FormCreate(Sender: TObject);
begin
  inherited;
  DBChart1.Legend.Inverted:=True;
  ComboFlat1.ItemIndex:=1; // sort by calculation
end;

initialization
  RegisterClass(TDBSummaryOrder);
end.
 
