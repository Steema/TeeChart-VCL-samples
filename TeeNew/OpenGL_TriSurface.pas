unit OpenGL_TriSurface;
{$I TeeDefs.inc}

interface

{ This example shows the Tri-Surface Charting style of
  TeeChart Pro with OpenGL.

  The "Tri-Surface" series allows you to add 3D points
  using the AddXYZ method using floating point values and
  without having to specify a "grid" of surface cells.

  So, you are free to add points at any XYZ coordinates:

    Series1.AddXYZ( 1.23 , 4.2984, 545.22 );
    Series1.AddXYZ( -325.3 , 67.32, 65.3 );
    Series1.AddXYZ( 66.2 , 821.2, -255.11 );
    ...

  and the TriSurface series will calculate the best set of
  "triangles" that connects all 3 points forming a surface.

  The triangles are displayed using the Pen and Brush of the
  Series, and the gradient and palette of colors are also
  available.
}


uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  SysUtils, Classes,
  TeeProcs, TeEngine, Chart, TeeComma, TeCanvas,
  TeeOpenGL, TeeEditPro, Series, TeePoin3, TeeSurfa, TeeTriSurface;

type
  TOpenGLTriSurface = class(TForm)
    Chart1: TChart;
    TeeOpenGL1: TTeeOpenGL;
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox6: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Series1: TTriSurfaceSeries;
    Series2: TPoint3DSeries;
    Series3: TSurfaceSeries;
    TeeCommander1: TTeeCommander;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
  private
    { Private declarations }
    Changing:Boolean;
    Procedure AddRandomPoint;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeTriSurfEdit, TeeGLEditor;

procedure TOpenGLTriSurface.FormCreate(Sender: TObject);
var t,
    tt : Integer;
begin
  Changing:=False;

  { Tri-Surface }
  With Series1 do
  begin
    Clear;
    for t:=1 to 30 do AddRandomPoint;

{ // some test...
    AddPoint(0,0,0);
    AddPoint(0.5,0.25,0.5);
    AddPoint(0.25,0,0.5);
    AddPoint(0,0.5,0.1);
    AddPoint(0.5,0.5,0.15);
}

    UsePalette:=True;
    UseColorRange:=False;

    Title:='Tri-Surface';
  end;

  { Point3D series }
  With Series2 do
  begin
    ColorEachPoint:=True;
    DataSource:=Series1;
    Pointer.VertSize:=8;
    Pointer.HorizSize:=8;
    Pointer.Style:=psCircle;
    DepthSize:=0;
    Active:=True;
  end;

  { Irregular Surface }
  With Series3 do
  begin
    Active:=False;
    IrregularGrid:=True;
    UsePalette:=True;
    UseColorRange:=False;
    Clear;
    NumXValues:=0;
    NumZValues:=0;
    for t:=1 to 10 do
        for tt:=1 to 10 do
            AddXYZ( t,(exp(1+cos(t)*tt+sin(t)*cos(tt))) ,(tt-5.0)/10.0);
  end;

  { Chart 3D settings }
  Chart1.View3DOptions.Perspective:=30;
  Chart1.View3DOptions.Zoom:=150;
end;

procedure TOpenGLTriSurface.CheckBox1Click(Sender: TObject);
begin
  TeeOpenGL1.Active:=CheckBox1.Checked
end;

procedure TOpenGLTriSurface.CheckBox2Click(Sender: TObject);
begin
  Series1.Pen.Visible:=CheckBox2.Checked
end;

procedure TOpenGLTriSurface.CheckBox3Click(Sender: TObject);
begin
  Series1.UsePalette:=CheckBox3.Checked;
  Series1.UseColorRange:=not Series1.UsePalette;
end;

procedure TOpenGLTriSurface.FormShow(Sender: TObject);
begin
  TeeCommander1.ButtonRotate.Down:=True;
end;

{ Some formula to calculate values... }
Procedure TOpenGLTriSurface.AddRandomPoint;
Const tmpRange=100;
var tmpX,tmpZ:Double;
begin
  tmpX:=-0.5+Random(tmpRange)/tmpRange;
  tmpZ:=-0.5+Random(tmpRange)/tmpRange;
  Series1.AddXYZ( tmpX,
                    -Sqrt(exp(tmpx * cos(sqr(tmpx)))) + sin(tmpz * tmpz)
                    ,tmpZ,'',clTeeColor);

  UpDown1.Max:=Series1.Count-1;
end;

procedure TOpenGLTriSurface.Button1Click(Sender: TObject);
begin
  { add one more random point to the Series }
  AddRandomPoint;
  Label1.Caption:='Num.Points: '+IntToStr(Series1.Count);
end;

procedure TOpenGLTriSurface.Button2Click(Sender: TObject);
begin
  { Remove one point (only when there are more than 8 points) }
  With Series1 do
  if Count>8 then
  begin
    { the Chart will repaint after deleting one point.. }
    Delete(Random(Count));
    UpDown1.Max:=Count-1;
  end;
end;

procedure TOpenGLTriSurface.CheckBox6Click(Sender: TObject);
begin
  Series1.Border.Visible:=CheckBox6.Checked;
end;

procedure TOpenGLTriSurface.ScrollBar1Change(Sender: TObject);
begin
  if not Changing then
  begin
    Series1.XValues[UpDown1.Position]:=ScrollBar1.Position/100.0;
    Series1.Repaint;
  end;
end;

procedure TOpenGLTriSurface.ScrollBar2Change(Sender: TObject);
begin
  if not Changing then
  begin
    Series1.YValues[UpDown1.Position]:=ScrollBar2.Position/50.0;
    Series1.Repaint;
  end;
end;

procedure TOpenGLTriSurface.ScrollBar3Change(Sender: TObject);
begin
  if not Changing then
  begin
    Series1.ZValues[UpDown1.Position]:=ScrollBar3.Position/100.0;
    Series1.Repaint;
  end;
end;

procedure TOpenGLTriSurface.CheckBox8Click(Sender: TObject);
var t : Integer;
begin
  for t:=0 to Chart1.SeriesCount-1 do
  if Chart1[t] is TPoint3DSeries then
     Chart1[t].Active:=CheckBox8.Checked;
end;

procedure TOpenGLTriSurface.CheckBox9Click(Sender: TObject);
var t:Integer;
begin
  for t:=0 to Chart1.SeriesCount-1 do
  if Chart1[t] is TSurfaceSeries then
     Chart1[t].Active:=CheckBox9.Checked;
  if CheckBox9.Checked then
  begin
    Chart1.LeftAxis.EndPosition:=50;
    Chart1.BottomAxis.EndPosition:=50;
  end
  else
  begin
    Chart1.LeftAxis.EndPosition:=100;
    Chart1.BottomAxis.EndPosition:=100;
  end;
end;

procedure TOpenGLTriSurface.Edit1Change(Sender: TObject);
begin
  Changing:=True;
  ScrollBar1.Position:=Round(100.0*Series1.XValues[UpDown1.Position]);
  ScrollBar2.Position:=Round(50.0*Series1.YValues[UpDown1.Position]);
  ScrollBar3.Position:=Round(100.0*Series1.ZValues[UpDown1.Position]);
  Changing:=False;
end;

procedure TOpenGLTriSurface.Series1GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  MarkText:=IntToStr(ValueIndex);
end;

initialization
  RegisterClass(TOpenGLTriSurface);
end.
