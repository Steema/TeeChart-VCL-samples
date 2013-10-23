unit Function_PercentChange;
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
  Base, TeEngine, CurvFitt, Series, TeeProcs, Chart, TeeTools, StatChar;

type
  TPercentChangeForm = class(TBaseForm)
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Series1: TAreaSeries;
    Series2: TLineSeries;
    Function1: TPercentChangeFunction;
  public
    { Public declarations }
  end;

var
  PercentChangeForm: TPercentChangeForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TPercentChangeForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1:=TAreaSeries.Create(Self);
  Chart1.AddSeries(Series1);
  with Series1 do
  begin
    Smoothed:=true;
    AreaLinesPen.Visible := False;
    Pen.Visible := False;
    AreaChartBrush.Gradient.Visible := True;
  end;

  Button1Click(Self);

  Function1:=TPercentChangeFunction.Create(Self);
  Series2:=TLineSeries.Create(Self);
  Chart1.AddSeries(Series2);
  with Series2 do
  begin
    Pen.Visible := False;
    FunctionType:=Function1;
    DataSource:=Series1;
    Marks.Visible:=True;
    Marks.Angle:=90;
    Marks.ArrowLength:=30;
    Marks.Font.Color:=clRed;
    Title:='Percentage change';
    Brush.Gradient.Visible := True;
    Brush.Gradient.EndColor := clNavy;
    Marks.Transparent := True;
    Marks.Arrow.Visible := False;
  end;

  Chart1.Draw;
end;

procedure TPercentChangeForm.Button1Click(Sender: TObject);
begin
  Series1.Clear;
  Series1.FillSampleValues(4);
end;

initialization
  RegisterClass(TPercentChangeForm);
end.
