unit SeriesType_Radar;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  SysUtils, Classes,
  TeEngine, Series, TeePolar, TeeProcs, Chart, TeeComma;

type
  TRadarForm = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    Chart1: TChart;
    Series1: TRadarSeries;
    Series2: TRadarSeries;
    Series3: TRadarSeries;
    TeeCommander1: TTeeCommander;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TRadarForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(5);
end;

procedure TRadarForm.CheckBox5Click(Sender: TObject);
begin
  Chart1.RightAxis.Visible:=CheckBox5.Checked
end;

procedure TRadarForm.CheckBox3Click(Sender: TObject);
begin
  Series1.Pen.Visible:=CheckBox3.Checked;
  Series2.Pen.Visible:=CheckBox3.Checked;
  Series3.Pen.Visible:=CheckBox3.Checked;
end;

procedure TRadarForm.CheckBox2Click(Sender: TObject);
begin
  Series1.CircleLabels:=CheckBox2.Checked;
end;

procedure TRadarForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Circled:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TRadarForm);
end.
