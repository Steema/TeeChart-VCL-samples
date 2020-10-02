unit Tool_DataTable;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeDataTableTool,
  TeeGDIPlus;

type
  TDataTableToolForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    DataTable : TDataTableTool;
  public
    { Public declarations }
  end;

implementation

uses 
  EditChar;

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TDataTableToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  DataTable:=TDataTableTool.Create(Self);
  DataTable.ParentChart:=Chart1;

  DataTable.Font.Size := 10;

  Series1.ValueFormat:='#,###';
  Series2.ValueFormat:='#,###';
  Series3.ValueFormat:='#,###';

  Chart1.Axes.Bottom.MinorTicks.Hide;

  Chart1[1].SetNull(3);
end;

procedure TDataTableToolForm.Button4Click(Sender: TObject);
begin
  Series1.FillSampleValues(1);
end;

procedure TDataTableToolForm.Button1Click(Sender: TObject);
begin
  Series1.FillSampleValues(2);
end;

procedure TDataTableToolForm.Button2Click(Sender: TObject);
var tmp : TChartSeriesClass;
begin
  if Series1.YMandatory then
     tmp:=THorizBarSeries
  else
     tmp:=TBarSeries;

  ChangeAllSeriesType(Chart1, tmp);
end;

procedure TDataTableToolForm.Button3Click(Sender: TObject);
var t : Integer;
begin
  for t:=0 to Chart1.SeriesCount-1 do
  with Chart1[t] do
  if YMandatory then
  begin
    if HorizAxis=aBottomAxis then
       HorizAxis:=aTopAxis
    else
       HorizAxis:=aBottomAxis;
  end
  else
  begin
    if VertAxis=aLeftAxis then
       VertAxis:=aRightAxis
    else
       VertAxis:=aLeftAxis;
  end;
end;

procedure TDataTableToolForm.CheckBox1Click(Sender: TObject);
var t : Integer;
begin
  for t:=0 to Chart1.SeriesCount-1 do
  with Chart1[t] do
  if Visible then
  begin
    if YMandatory then
       with GetHorizAxis do Inverted:=CheckBox1.Checked
    else
       with GetVertAxis do Inverted:=CheckBox1.Checked;

    break;
  end;
end;

procedure TDataTableToolForm.Button5Click(Sender: TObject);
begin
  EditChartTool(Self,DataTable);
end;

initialization
  RegisterClass(TDataTableToolForm);
end.
