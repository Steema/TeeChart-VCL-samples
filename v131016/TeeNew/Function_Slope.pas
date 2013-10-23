unit Function_Slope;
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
  TSlopeForm = class(TBaseForm)
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Series1: TAreaSeries;
    Series2: TLineSeries;
    Function1: TSlopeFunction;
  public
    { Public declarations }
  end;

var
  SlopeForm: TSlopeForm;  

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSlopeForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1:=TAreaSeries.Create(Self);
  Chart1.AddSeries(Series1);
  Series1.Smoothed:=true;
  Button1Click(Self);

  Function1:=TSlopeFunction.Create(Self);
  Series2:=TLineSeries.Create(Self);
  Chart1.AddSeries(Series2);
  Series2.FunctionType:=Function1;
  Series2.DataSource:=Series1;
  Series2.Marks.Visible:=True;
  Series2.Marks.Angle:=90;
  Series2.Marks.ArrowLength:=30;
  Series2.Marks.Font.Color:=clRed;
  Series2.Title:='Slope';

  Chart1.Draw;  
end;

procedure TSlopeForm.Button1Click(Sender: TObject);
begin
  Series1.Clear;
  Series1.FillSampleValues(4);
end;

initialization
  RegisterClass(TSlopeForm);
end.
