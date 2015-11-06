//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OpenGL_Canvas.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeeOpenGL"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TOpenGLCanvas *OpenGLCanvas;
//---------------------------------------------------------------------------
__fastcall TOpenGLCanvas::TOpenGLCanvas(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TOpenGLCanvas::Chart1AfterDraw(TObject *Sender)
{
  // Draw the 3D objects at the AfterDraw event of the Chart1

  TCanvas3D *c = Chart1->Canvas;
  c->Brush->Style = bsSolid;
  c->Pen->Style = psClear;
  if (CheckBox1->Checked) c->Pen->Style = psSolid;
  c->Pen->Color = clBlack;
  int x = Chart1->ChartXCenter;

  if (CheckBox2->Checked) c->Brush->Bitmap = MyBitmap1;
  c->Cube(x-500,x+500,500,550,-500,500,true);

  if (CheckBox2->Checked) c->Brush->Bitmap = MyBitmap0;
  c->Cube(x-500,x-450,0,500,-500,500,true);
  c->Cube(x-450,x-100,0,500,-500,-400,true);
  c->Cube(x-450,x-100,0,500,400,500,true);

  c->Brush->Bitmap = NULL;

  c->Brush->Color = TColor(RGB(200,200,250));
  if (CheckBox2->Checked) c->Brush->Bitmap = MyBitmap2;
  c->Cube(x-500,x+500,-100,0,-500,500,true);
  c->Brush->Bitmap = NULL;

  c->Brush->Color = clYellow;
  c->Sphere(x-450,-150,-450,50);
  c->Sphere(x-450,-150,450,50);
  c->Sphere(x+450,-150,450,50);
  c->Sphere(x+450,-150,-450,50);

  c->Brush->Color = TColor(RGB(20,100,220));
  c->Pyramid(true,x-500,-400,x+500,-200,-500,500,true);

  c->Brush->Color = TColor(RGB(40,250,120));
  c->Pen->Style = psClear;
  c->Cylinder(true,x+450,0,x+500,500,-500,-450,true);
  c->Cylinder(true,x+450,0,x+500,500,450,500,true);

  if (CheckBox2->Checked) c->Brush->Bitmap = MyBitmap3;
  c->RectangleZ(x-375,100,400,-350,350);

  c->Brush->Bitmap = NULL;

  if (CheckBox1->Checked) c->Pen->Style = psSolid;

  c->Pen->Color = clBlack;
  c->MoveTo3D(x-375,100,-250);
  c->LineTo3D(x-375,50,0);
  c->LineTo3D(x-375,100,250);

  c->Brush->Color = TColor(RGB(255,215,196));
  c->Cube(x-100,x,400,500,-200,200,true);

  c->Brush->Color = clRed;
  if (CheckBox2->Checked) c->Brush->Bitmap = MyBitmap0;
  c->Sphere(x-50,350,-175,50);
  c->Brush->Bitmap = NULL;

  c->Brush->Color = clBlue;
  c->Sphere(x-50,350,0,50);

  c->Brush->Color = clGreen;
  c->Sphere(x-50,350,175,50);

  c->Brush->Color = TColor(RGB(234,106,218));
  if (CheckBox1->Checked) c->Pen->Style = psSolid;

  c->Pen->Color = clRed;
  c->Cone(true,300,250,500,500,0,300,true,0);
  c->Font->Size = 60;
  c->Font->Color = clBlue;
  c->TextOut3D(200,430,-400,"teeChart Pro");

  c->Font->Color = clLime;
  TeeTextAngleY = ScrollBar1->Position;
  TeeTextAngleZ = ScrollBar2->Position;
  c->RotateLabel3D(ScrollBar4->Position,ScrollBar5->Position,
      ScrollBar6->Position,"100% Native Delphi",ScrollBar3->Position);
  TeeTextAngleY = 0;
  TeeTextAngleZ = 0;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::FormCreate(TObject *Sender)
{
  // Set the OpenGL Font parameter
  TeeOpenGL1->FontExtrusion = 12;

  // Start OpenGL
  TeeOpenGL1->Active = true;

  // this variable is for the animation only
  DeltaZ = 2;

  // Get the bitmaps from the Image components
  MyBitmap0 = new Graphics::TBitmap();
  MyBitmap0->Assign(Image2->Picture);

  MyBitmap1 = new Graphics::TBitmap();
  MyBitmap1->Assign(Image3->Picture);

  MyBitmap2 = new Graphics::TBitmap();
  MyBitmap2->Assign(Image4->Picture);

  MyBitmap3 = new Graphics::TBitmap();
  MyBitmap3->Assign(Image5->Picture);

  //  setup the 3D parameters
  TView3DOptions *opt = Chart1->View3DOptions;
  opt->Perspective = 70;
  opt->Zoom = 27;
  opt->Rotation = 348;
  opt->Elevation = 360;
  opt->HorizOffset = -38;
  opt->VertOffset = -130;

  // set colors
  Chart1->Color = clDkGray;
  ConeColor = clYellow;

  // add random values to Series1
  Series1->FillSampleValues(20);

  // some more parameters
  Chart1->Legend->Visible = false;
  Chart1->Title->Visible = false;
  Chart1->Chart3DPercent = 100;
  ConeRotation = 0;

  // set the default toolbar button
  TeeCommander1->ButtonRotate->Down = true;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::ScrollBar3Change(TObject *Sender)
{
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::ScrollBar7Change(TObject *Sender)
{
  TeeOpenGL1->Light->Position->X = ScrollBar7->Position;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::ScrollBar8Change(TObject *Sender)
{
  TeeOpenGL1->Light->Position->Y = ScrollBar8->Position;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::ScrollBar9Change(TObject *Sender)
{
  TeeOpenGL1->Light->Position->Z = ScrollBar9->Position;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::CheckBox3Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::Timer1Timer(TObject *Sender)
{
  TView3DOptions *opt = Chart1->View3DOptions;
  if (opt->Zoom > 35) opt->Rotation += 2;
  else opt->Rotation += 1;
  if (opt->Rotation >= 360)  opt->Rotation = 0;

  opt->Zoom += DeltaZ;
  if (opt->Zoom>50 || opt->Zoom<25) DeltaZ = -DeltaZ;
  if (random(100) == 1)
  {
    switch (random(5))
    {
      case 0: ConeColor = clBlue; break;
      case 1: ConeColor = clRed; break;
      case 2: ConeColor = clLime; break;
      case 3: ConeColor = clYellow; break;
      case 4: ConeColor = clWhite; break;
    }
  }
  ++ConeRotation;
  if (ConeRotation>360) ConeRotation = 0;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLCanvas::CheckBox1Click(TObject *Sender)
{
  Series1->Pen->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

