unit Function_Correlation;
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
  Base, CurvFitt, TeEngine, Series, TeeProcs, Chart;

type
  TCorrelationFunctionDemo = class(TBaseForm)
    Series1: TPointSeries;
    Series2: TLineSeries;
    TeeFunction1: TCorrelationFunction;
    CheckBox1: TCheckBox;
    Series3: TLineSeries;
    TeeFunction2: TTrendFunction;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TCorrelationFunctionDemo.CheckBox1Click(Sender: TObject);
begin
  Series3.Visible:=CheckBox1.Checked;
end;

procedure TCorrelationFunctionDemo.Button1Click(Sender: TObject);
begin
  Series1.FillSampleValues;
end;

procedure TCorrelationFunctionDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TCorrelationFunctionDemo);
end.
