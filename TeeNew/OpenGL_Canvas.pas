unit OpenGL_Canvas;
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
  {$IFDEF LINUX}
  OpenGLLinux,
  {$ELSE}
  OpenGL2,
  {$ENDIF}
  {$ENDIF}
  TeeProcs, TeCanvas, TeeOpenGL, TeeComma, Chart, TeeGLCanvas, TeeSurfa,
  TeeEditPro, TeEngine;

type
  TOpenGLCanvas = class(TForm)
    Chart1: TChart;
    TeeCommander1: TTeeCommander;
    TeeOpenGL1: TTeeOpenGL;
    Panel1: TPanel;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    ScrollBar4: TScrollBar;
    ScrollBar5: TScrollBar;
    ScrollBar6: TScrollBar;
    Label2: TLabel;
    Label3: TLabel;
    ScrollBar7: TScrollBar;
    ScrollBar8: TScrollBar;
    ScrollBar9: TScrollBar;
    Timer1: TTimer;
    Series1: TSurfaceSeries;
    CheckBox3: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure Chart1AfterDraw(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar7Change(Sender: TObject);
    procedure ScrollBar8Change(Sender: TObject);
    procedure ScrollBar9Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MyBitmap0,
    MyBitmap1,
    MyBitmap2,
    MyBitmap3     : TBitmap;
    ConeColor     : TColor;
    ConeRotation,
    DeltaZ        : Integer;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{ Draw the 3D objects at the AfterDraw event of the Chart1 }
procedure TOpenGLCanvas.Chart1AfterDraw(Sender: TObject);
var x : Integer;
begin
  With Chart1,Canvas do
  begin
    Brush.Style:=bsSolid;
    Pen.Style:=psClear;

    if CheckBox1.Checked then Pen.Style:=psSolid;

    Pen.Color:=clBlack;
    x:=ChartXCenter;
    if CheckBox2.Checked then Brush.Bitmap:=MyBitmap1;
    Cube(x-500,x+500,500,550,-500,500,True);

    if CheckBox2.Checked then Brush.Bitmap:=MyBitmap0;
    Cube(x-500,x-450,0,500,-500,500,True);
    Cube(x-450,x-100,0,500,-500,-400,True);
    Cube(x-450,x-100,0,500,400,500,True);

    Brush.Bitmap:=nil;

    Brush.Color:=RGB(200,200,250);
    if CheckBox2.Checked then Brush.Bitmap:=MyBitmap2;
    Cube(x-500,x+500,-100,0,-500,500,True);
    Brush.Bitmap:=nil;

    Brush.Color:=clYellow;
    Sphere(x-450,-150,-450,50);
    Sphere(x-450,-150,450,50);
    Sphere(x+450,-150,450,50);
    Sphere(x+450,-150,-450,50);

    Brush.Color:=RGB(20,100,220);
    Pyramid(True,x-500,-400,x+500,-200,-500,500,True);

    Brush.Color:=RGB(40,250,120);
    Pen.Style:=psClear;
    Cylinder(True,x+450,0,x+500,500,-500,-450,True);
    Cylinder(True,x+450,0,x+500,500,450,500,True);

    if CheckBox2.Checked then Brush.Bitmap:=MyBitmap3;
    RectangleZ(x-375,100,400,-350,350);

    Brush.Bitmap:=nil;

    if CheckBox1.Checked then Pen.Style:=psSolid;

    Pen.Color:=clBlack;
    MoveTo3D(x-375,100,-250);
    LineTo3D(x-375,50,0);
    LineTo3D(x-375,100,250);

    Brush.Color:=RGB(255,215,196);
    Cube(x-100,x,400,500,-200,200,True);

    Brush.Color:=clRed;
    if CheckBox2.Checked then Brush.Bitmap:=MyBitmap0;
    Sphere(x-50,350,-175,50);
    Brush.Bitmap:=nil;

    Brush.Color:=clBlue;
    Sphere(x-50,350,0,50);

    Brush.Color:=clGreen;
    Sphere(x-50,350,175,50);

    Brush.Color:=RGB(234,106,218);
    if CheckBox1.Checked then Pen.Style:=psSolid;

    Pen.Color:=clRed;
    Cone(True,300,250,500,500,0,300,True,0);

    Font.Size:=60;
    Font.Color:=clBlue;
    TextOut3D(200,430,-400,'teeChart Pro');

    Font.Color:=clLime;
    TeeTextAngleY:=ScrollBar1.Position;
    TeeTextAngleZ:=ScrollBar2.Position;
    RotateLabel3D(ScrollBar4.Position,ScrollBar5.Position,
      ScrollBar6.Position,'100% Native Delphi',ScrollBar3.Position);
    TeeTextAngleY:=0;
    TeeTextAngleZ:=0;
  end;
end;

procedure TOpenGLCanvas.FormCreate(Sender: TObject);
begin
  { Set the OpenGL Font Extrusion (Font 3D Depth) parameter }
  TeeOpenGL1.FontExtrusion:=12;

  { Start OpenGL }
  TeeOpenGL1.Active:=True;

  { this variable is for the animation only }
  DeltaZ:=1;

  { Get the bitmaps from the Image components }
  MyBitmap0:=TBitmap.Create;
  MyBitmap0.Assign(Image2.Picture);

  MyBitmap1:=TBitmap.Create;
  MyBitmap1.Assign(Image3.Picture);

  MyBitmap2:=TBitmap.Create;
  MyBitmap2.Assign(Image4.Picture);

  MyBitmap3:=TBitmap.Create;
  MyBitmap3.Assign(Image5.Picture);

  { setup the 3D parameters }
  With Chart1.View3DOptions do
  begin
    Perspective:=70;
    Zoom:=27;
    Rotation:=348;
    Elevation:=360;
    HorizOffset:=-38;
    VertOffset:=-130;
  end;

  { set colors }
  Chart1.Color:=clDkGray;
  ConeColor:=clYellow;

  { add random values to Series1 }
  Series1.FillSampleValues(20);

  { some more parameters }
  Chart1.Legend.Visible:=False;
  Chart1.Title.Visible:=False;
  Chart1.Chart3DPercent:=100;
  ConeRotation:=0;

  { set the default toolbar button }
  TeeCommander1.ButtonRotate.Down:=True;
end;

procedure TOpenGLCanvas.ScrollBar3Change(Sender: TObject);
begin
  Chart1.Repaint;
end;

{ move the Light X }
procedure TOpenGLCanvas.ScrollBar7Change(Sender: TObject);
begin
  TeeOpenGL1.Light.Position.X:=ScrollBar7.Position;
end;

{ move the Light Y }
procedure TOpenGLCanvas.ScrollBar8Change(Sender: TObject);
begin
  TeeOpenGL1.Light.Position.Y:=ScrollBar8.Position;
end;

{ move the Light Z }
procedure TOpenGLCanvas.ScrollBar9Change(Sender: TObject);
begin
  TeeOpenGL1.Light.Position.Z:=ScrollBar9.Position;
end;

{ start / stop the animation }
procedure TOpenGLCanvas.CheckBox3Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox3.Checked;
end;

{ rotation animation }
procedure TOpenGLCanvas.Timer1Timer(Sender: TObject);
begin
  With Chart1.View3DOptions do
  begin
    if Zoom>35 then Rotation:=Rotation+2
               else Rotation:=Rotation+1;
    if Rotation>=360 then Rotation:=0;

    Zoom:=Zoom+DeltaZ;
    if (Zoom>50) or (Zoom<25) then DeltaZ:=-DeltaZ;

    if Random(100)=1 then
       Case Random(5) of
       0: ConeColor:=clBlue;
       1: ConeColor:=clRed;
       2: ConeColor:=clLime;
       3: ConeColor:=clYellow;
       4: ConeColor:=clWhite;
       end;
  end;
  Inc(ConeRotation);
  if ConeRotation>360 then ConeRotation:=0;
end;

procedure TOpenGLCanvas.CheckBox1Click(Sender: TObject);
begin
  Series1.Pen.Visible:=CheckBox1.Checked;
end;

procedure TOpenGLCanvas.FormDestroy(Sender: TObject);
begin
  // destroy temporary bitmaps...
  MyBitmap3.Free;
  MyBitmap2.Free;
  MyBitmap1.Free;
  MyBitmap0.Free;
end;

initialization
  RegisterClass(TOpenGLCanvas);
end.
