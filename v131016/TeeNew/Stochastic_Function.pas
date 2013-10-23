unit Stochastic_Function;
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
  TStochasticForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TLineSeries;
    TeeFunction1: TStochasticFunction;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorBandTool;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TStochasticForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(60);
end;

procedure TStochasticForm.CheckBox1Click(Sender: TObject);
begin
  Series2.Active:=CheckBox1.Checked;
  Chart1.Legend.Visible:=CheckBox1.Checked;

  { resize the Left axis }
  if CheckBox1.Checked then Chart1.LeftAxis.EndPosition:=75
                       else Chart1.LeftAxis.EndPosition:=100;

  Edit1.Enabled:=CheckBox1.Checked;
  UpDown1.Enabled:=CheckBox1.Checked;

  { show / hide the color band }
  ChartTool1.Active:=CheckBox1.Checked;
  ChartTool2.Active:=CheckBox1.Checked;
end;

procedure TStochasticForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position
end;

initialization
  RegisterClass(TStochasticForm);
end.
