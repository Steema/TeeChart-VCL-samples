unit DBChart_CrossTabSource;
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
  Base, TeeProcs, TeEngine, Chart, DB, DBTables, Series, TeeDBEdit,
  TeeDBCrosstab, Base_DBChart, DBChart;

type
  TDBCrossTabSourceDemo = class(TBaseDBChart)
    DBCrossTabSource1: TDBCrossTabSource;
    Series1: TBarSeries;
    Table1: TTable;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TDBCrossTabSourceDemo.FormShow(Sender: TObject);
begin
  inherited;
  CheckTable(Table1);
end;

procedure TDBCrossTabSourceDemo.CheckBox1Click(Sender: TObject);
begin
  Table1.Active:=CheckBox1.Checked;
end;

procedure TDBCrossTabSourceDemo.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
     DBCrossTabSource1.Formula:=gfCount
  else
     DBCrossTabSource1.Formula:=gfSum;

  Table1.Open;
  DBCrossTabSource1.Open;
end;

procedure TDBCrossTabSourceDemo.Button1Click(Sender: TObject);
var tmp : String;
begin
  // Exchange (swap) GroupField with LabelsField
  with DBCrossTabSource1 do
  begin
    tmp:=GroupField;
    GroupField:=LabelField;
    LabelField:=tmp;
    Open;
  end;

  Table1.Open;
end;

initialization
  RegisterClass(TDBCrossTabSourceDemo);
end.
