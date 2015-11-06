unit SeriesType_Contour;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, TeeSurfa;

type
  TContourSeriesForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox3: TCheckBox;
    ChartTool1: TRotateTool;
    ScrollBar1: TScrollBar;
    ContourSeries: TContourSeries;
    SurfaceSeries: TSurfaceSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ContourSeriesGetLevel(Sender: TContourSeries;
      LevelIndex: Integer; var Value: Double; var Color: TColor);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
  private
    { Private declarations }
    Function RandomXYZ(x,z:Integer):Double;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TContourSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=not CheckBox1.Checked;
end;

procedure TContourSeriesForm.FormCreate(Sender: TObject);
var x,z:Integer;
begin
  inherited;

  ScrollBar1.Align:=alRight;  { <--- prevent Delphi 3 error }

  { First we add XYZ points to the Contour series... }
  With ContourSeries do
  begin
    Clear;   { We add values from 0 to 1000.  21x21 cells = 441 }
    for x:= -10 to 10 do
        for z:= -10 to 10 do
            AddXYZ( x, RandomXYZ(x,z) ,z, '', clTeeColor);
  end;

  { Then we specify how many "contour levels" we want }
  ContourSeries.NumLevels:=10;

  { We specify the Y levels position to the "middle" }
  With ContourSeries do
    YPosition:=(YValues.MaxValue+YValues.MinValue)/2.0;

  ScrollBar1.Position:=1000-Round(ContourSeries.YPosition);

  { We can set some Chart properties to improve aspect }
  Chart1.Chart3DPercent:=100;

  { We can also use a Surface series... }
  SurfaceSeries.DataSource:=ContourSeries;
end;

procedure TContourSeriesForm.CheckBox5Click(Sender: TObject);
begin
  Chart1.View3DWalls:=CheckBox5.Checked
end;

procedure TContourSeriesForm.CheckBox2Click(Sender: TObject);
begin
  ContourSeries.ColorEachPoint:=CheckBox2.Checked;
end;

procedure TContourSeriesForm.ContourSeriesGetLevel(Sender: TContourSeries;
  LevelIndex: Integer; var Value: Double; var Color: TColor);
begin
  { Here we specify the 10 Level values }
  Case LevelIndex of
    0: Value:=0;
    1: Value:=100;
    2: Value:=200;
    3: Value:=300;
    4: Value:=400;
    5: Value:=500;
    6: Value:=600;
    7: Value:=700;
    8: Value:=800;
    9: Value:=900;
  else
    Value:=LevelIndex*100;
  end;
  { We can also specify here the exact Color for each level.
    For example:

     if Value=500 then Color:=clRed;
  }
end;

procedure TContourSeriesForm.CheckBox3Click(Sender: TObject);
begin
  SurfaceSeries.Active:=CheckBox3.Checked; { show / hide surface }
end;

procedure TContourSeriesForm.CheckBox4Click(Sender: TObject);
begin
  { Turn on / off the automatic Y level positions }
  ContourSeries.YPositionLevel:=CheckBox4.Checked;
end;

procedure TContourSeriesForm.ScrollBar1Change(Sender: TObject);
begin
  { We don't want each Level to have automatic Y position }
  ContourSeries.YPositionLevel:=False;

  { Force the Level Y position }
  ContourSeries.YPosition:=1000-ScrollBar1.Position;
end;

Function TContourSeriesForm.RandomXYZ(x,z:Integer):Double;

  Function ToAngle(Value:Integer):Double;
  begin
    result:=((Value+10)*18.0)*Pi/180.0;
  end;

begin
  result:=(500.0*(Sin(ToAngle(x)) + Sqr(Cos(ToAngle(z)))));
end;

initialization
  RegisterClass(TContourSeriesForm);
end.
