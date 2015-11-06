unit FastLine_DrawAll;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeeGDIPlus;

type
  TFastLineDrawAll = class(TBaseForm)
    Series1: TFastLineSeries;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TFastLineDrawAll.RadioButton1Click(Sender: TObject);
begin
  RadioButton2.Checked:=False;
  Series1.DrawAllPoints:=True;
end;

procedure TFastLineDrawAll.RadioButton2Click(Sender: TObject);
begin
  RadioButton1.Checked:=False;
  Series1.DrawAllPoints:=False;
end;

procedure TFastLineDrawAll.FormShow(Sender: TObject);
Const NumPoints = 1000000;  { one million ! }
var t : Integer;
    MyX,
    MyY : TChartValues;
    tmp : Double;
begin
  inherited;

  // Set axis calculations in "fast mode".
  // Note: For Windows Me and 98 might produce bad drawings when
  //       chart zoom is very big.
  Chart1.Axes.FastCalc:=True;

  { tell Series1 to draw non-repeated points only ( much faster ! ) }
  Series1.DrawAllPoints:=False;

  { lets add one million points to Series1... }
  SetLength(MyX,NumPoints);
  SetLength(MyY,NumPoints);

  tmp:=Random(10000);
  for t:=0 to NumPoints-1 do
  begin
    tmp:=tmp+Random(100)-49.5;
    MyX[t]:=t;
    MyY[t]:=tmp;
  end;

  with Series1 do
  begin
    XValues.Count:=NumPoints;
    XValues.Value:=MyX;

    YValues.Count:=NumPoints;
    YValues.Value:=MyY;
  end;
end;

initialization
  RegisterClass(TFastLineDrawAll);
end.
