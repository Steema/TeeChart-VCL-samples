unit Function_Skewness;
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
  TSkewnessForm = class(TBaseForm)
    Series1: TAreaSeries;
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    Series2: TLineSeries;
    TeeFunction1: TSkewnessFunction;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SkewnessForm: TSkewnessForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSkewnessForm.FormCreate(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

procedure TSkewnessForm.Button1Click(Sender: TObject);
begin
  Series1.Clear;
  Series1.FillSampleValues(20);
  Chart1.Gradient.Visible := False;
  Chart1.Walls.Back.Transparent := True;
end;

initialization
  RegisterClass(TSkewnessForm);
end.
