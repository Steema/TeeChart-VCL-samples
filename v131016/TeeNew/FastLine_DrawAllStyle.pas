unit FastLine_DrawAllStyle;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TFastLineDrawAllStyle = class(TBaseForm)
    Series1: TFastLineSeries;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FastLineDrawAllStyle: TFastLineDrawAllStyle;
    
implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFastLineDrawAllStyle.FormShow(Sender: TObject);
Const NumPoints = 1000000;  { one million ! }
var t : Integer;
    MyX,
    MyY : TChartValues;
    tmp : Double;

    {$IFDEF CLR}
    tmpValues : TChartValueList;
    {$ENDIF}
begin
  inherited;

  ComboBox1.ItemIndex:=0;

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

  {$IFDEF CLR} // dccil bug
  
  tmpValues:=Series1.XValues;
  tmpValues.Count:=NumPoints;
  tmpValues.Value:=MyX;

  tmpValues:=Series1.YValues;
  tmpValues.Count:=NumPoints;
  tmpValues.Value:=MyY;

  {$ELSE}

  with Series1 do
  begin
    XValues.Count:=NumPoints;
    XValues.Value:=MyX;

    YValues.Count:=NumPoints;
    YValues.Value:=MyY;
  end;

  {$ENDIF}
end;

procedure TFastLineDrawAllStyle.CheckBox1Click(Sender: TObject);
begin
  Series1.DrawAllPoints:=CheckBox1.Checked;
  Label1.Enabled:=not CheckBox1.Checked;
  ComboBox1.Enabled:=not CheckBox1.Checked;
end;

procedure TFastLineDrawAllStyle.ComboBox1Change(Sender: TObject);
begin
  Series1.DrawAllPointsStyle:=TDrawAllPointsStyle(ComboBox1.ItemIndex);
end;

initialization
  RegisterClass(TFastLineDrawAllStyle);
end.
