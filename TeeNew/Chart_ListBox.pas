unit Chart_ListBox;
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
  Base, BubbleCh, Series, TeEngine, TeeLisB, TeeProcs, Chart;

type
  TChartListBoxForm = class(TBaseForm)
    ChartListBox1: TChartListBox;
    Series1: TLineSeries;
    Series2: TPointSeries;
    Series3: TFastLineSeries;
    Series4: TBubbleSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Splitter1: TSplitter;
    Button1: TButton;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
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

procedure TChartListBoxForm.CheckBox2Click(Sender: TObject);
begin
  ChartListBox1.EnableChangeType:=CheckBox2.Checked
end;

procedure TChartListBoxForm.Chart1AfterDraw(Sender: TObject);
var wasFalse: Boolean;
begin
  inherited;
  wasFalse:=not ChartListBox1.Visible;
  if wasFalse then
  begin
    ChartListBox1.Visible:=true;
    Chart1.Repaint;
  end;
end;

procedure TChartListBoxForm.CheckBox1Click(Sender: TObject);
begin
  ChartListBox1.EnableChangeColor:=CheckBox1.Checked
end;

procedure TChartListBoxForm.CheckBox3Click(Sender: TObject);
begin
  ChartListBox1.EnableDragSeries:=CheckBox3.Checked
end;

procedure TChartListBoxForm.FormCreate(Sender: TObject);
begin
  ChartListBox1.Visible:=false;
  inherited;
  Chart1.SeriesList.FillSampleValues(8);
  Chart1.Draw;
end;

procedure TChartListBoxForm.CheckBox4Click(Sender: TObject);
begin
  ChartListBox1.AllowDeleteSeries:=CheckBox4.Checked
end;

procedure TChartListBoxForm.CheckBox5Click(Sender: TObject);
begin
  ChartListBox1.AllowAddSeries:=CheckBox5.Checked
end;

procedure TChartListBoxForm.CheckBox6Click(Sender: TObject);
begin
  ChartListBox1.ShowSeriesIcon:=CheckBox6.Checked
end;

procedure TChartListBoxForm.CheckBox8Click(Sender: TObject);
begin
  ChartListBox1.ShowSeriesColor:=CheckBox8.Checked
end;

procedure TChartListBoxForm.CheckBox9Click(Sender: TObject);
begin
  ChartListBox1.ShowSeriesTitle:=CheckBox9.Checked
end;

procedure TChartListBoxForm.CheckBox7Click(Sender: TObject);
begin
  ChartListBox1.ShowActiveCheck:=CheckBox7.Checked
end;

procedure TChartListBoxForm.Button1Click(Sender: TObject);
begin
  ChartListBox1.RenameSeries;
end;

initialization
  RegisterClass(TChartListBoxForm);
end.
