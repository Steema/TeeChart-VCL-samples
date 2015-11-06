unit Tools_Fibonacci;
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
  Base, TeCanvas, TeEngine, Series, CandleCh, TeeProcs, Chart, TeePenDlg,
  TeeFibonacci, OHLChart;

type
  TToolsFibonacci = class(TBaseForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Label2: TLabel;
    ButtonPen1: TButtonPen;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Series1: TCandleSeries;
    ChartTool1: TFibonacciTool;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AdjusBottomAxis;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TToolsFibonacci.AdjusBottomAxis;
begin
  if ((ChartTool1.DrawStyle = fsFan) or
     ((ChartTool1.DrawStyle = fsRetracement) and (ChartTool1.EndX = Chart1.Axes.Bottom.Maximum))) then
    Chart1.Axes.Bottom.MaximumOffset := 25
  else
    Chart1.Axes.Bottom.MaximumOffset := 0;
end;

procedure TToolsFibonacci.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(40);
  ChartTool1.StartX:=Series1.DateValues[0];
  ChartTool1.StartY:=Series1.CloseValues[0];
  ChartTool1.EndX:=Series1.DateValues[10];
  ChartTool1.EndY:=Series1.CloseValues[10];
  ButtonPen1.Pen:=ChartTool1.TrendPen;
  ComboBox1.ItemIndex:=0;
end;

procedure TToolsFibonacci.Edit1Change(Sender: TObject);
begin
  ChartTool1.StartX:=Series1.DateValues[UpDown1.Position];
  ChartTool1.StartY:=Series1.CloseValues[UpDown1.Position];
  AdjusBottomAxis;
end;

procedure TToolsFibonacci.Edit2Change(Sender: TObject);
begin
  ChartTool1.EndX:=Series1.DateValues[UpDown2.Position];
  ChartTool1.EndY:=Series1.CloseValues[UpDown2.Position];
  AdjusBottomAxis;
end;

procedure TToolsFibonacci.ComboBox1Change(Sender: TObject);
begin
  ChartTool1.DrawStyle:=TFibonacciStyle(ComboBox1.ItemIndex);
  AdjusBottomAxis;
end;

procedure TToolsFibonacci.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.ShowLabels:=CheckBox1.Checked;
  AdjusBottomAxis;
end;

initialization
  RegisterClass(TToolsFibonacci);
end.
