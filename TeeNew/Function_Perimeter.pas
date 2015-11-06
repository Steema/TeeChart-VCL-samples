unit Function_Perimeter;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeCanvas, TeeProcs, Chart, StatChar;

type
  TPerimeterDemo = class(TBaseForm)
    Series1: TPointSeries;
    Series2: TLineSeries;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TPerimeterDemo.FormCreate(Sender: TObject);
begin
  inherited;

  Series2.XValues.Order:=loNone;
  Series2.DataSource:=Series1;
  Series2.FunctionType:=TPerimeterFunction.Create(Self);  // StatChar.pas unit

  Button1Click(Self);
end;

procedure TPerimeterDemo.Button1Click(Sender: TObject);
var t : Integer;
begin
  Randomize;

  Series1.Clear;
  for t:=0 to 99 do
      Series1.AddXY(Random(100)*Random(10),Random(100)*Random(10));

  Series2.FunctionType.ReCalculate;
end;

initialization
  RegisterClass(TPerimeterDemo);
end.
