unit MACD_Function;
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
  Base, TeCanvas, TeEngine, StatChar, Series, OHLChart, CandleCh, TeeProcs,
  Chart, TeeTools;

type
  TMACDForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TLineSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    TeeFunction1: TMACDFunction;
    Label2: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit3: TEdit;
    UpDown3: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
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

procedure TMACDForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(120);
end;

procedure TMACDForm.CheckBox1Click(Sender: TObject);
begin
  Series2.Active:=CheckBox1.Checked;
  TeeFunction1.MACDExp.Active:=Series2.Active;
  TeeFunction1.Histogram.Active:=Series2.Active;

  Chart1.Legend.Visible:=CheckBox1.Checked;

  Edit1.Enabled:=CheckBox1.Checked;
  UpDown1.Enabled:=CheckBox1.Checked;

  { adjust axes... }
  Chart1.CustomAxes[0].Visible:=Series2.Active;
  if Series2.Active then Chart1.LeftAxis.EndPosition:=50
                    else Chart1.LeftAxis.EndPosition:=100;
end;

procedure TMACDForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position
end;

procedure TMACDForm.Edit2Change(Sender: TObject);
begin
  TeeFunction1.Period2:=UpDown2.Position
end;

procedure TMACDForm.CheckBox2Click(Sender: TObject);
begin
  inherited;
  TeeFunction1.MACDExp.Active:=CheckBox2.Checked;
end;

procedure TMACDForm.CheckBox3Click(Sender: TObject);
begin
  inherited;
  TeeFunction1.Histogram.Active:=CheckBox3.Checked;
end;

procedure TMACDForm.Edit3Change(Sender: TObject);
begin
  TeeFunction1.Period3:=UpDown3.Position;
end;

initialization
  RegisterClass(TMACDForm);
end.
