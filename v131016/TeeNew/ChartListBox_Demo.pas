unit ChartListBox_Demo;
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
  Series, TeEngine, TeeProcs, Chart, TeeLisB, TeeComma;

type
  TListBoxForm = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    TeeCommander1: TTeeCommander;
    ChartListBox1: TChartListBox;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TBarSeries;
    Series3: TPointSeries;
    Series4: TFastLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TListBoxForm.CheckBox4Click(Sender: TObject);
begin
  ChartListBox1.ShowSeriesTitle:=CheckBox4.Checked;
end;

procedure TListBoxForm.CheckBox2Click(Sender: TObject);
begin
  ChartListBox1.ShowSeriesColor:=CheckBox2.Checked;
end;

procedure TListBoxForm.CheckBox1Click(Sender: TObject);
begin
  ChartListBox1.ShowActiveCheck:=CheckBox1.Checked;
end;

procedure TListBoxForm.CheckBox3Click(Sender: TObject);
begin
  ChartListBox1.ShowSeriesIcon:=CheckBox3.Checked;
end;

procedure TListBoxForm.FormCreate(Sender: TObject);
begin
  { fill sample values. Some series are missing intentionally,
    to show at the list-box }
  Series1.FillSampleValues(20);
  Series3.FillSampleValues(10);
  Series4.FillSampleValues(20);
  Series6.FillSampleValues(20);
  Series7.FillSampleValues(20);
  Series2.FillSampleValues(6);

  { select the rotate button in the toolbar }
  TeeCommander1.ButtonRotate.Down:=True;
end;

initialization
  RegisterClass(TListBoxForm);
end.

