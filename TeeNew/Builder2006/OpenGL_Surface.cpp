//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#include <stdio.h>
#pragma hdrstop

#include "OpenGL_Surface.h"
#include "TeeGLEditor.hpp"
#include "TeeGLCanvas.hpp"
#include "OpenGL2.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeeOpenGL"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TOpenGLSurface *OpenGLSurface;
//---------------------------------------------------------------------------
__fastcall TOpenGLSurface::TOpenGLSurface(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TOpenGLSurface::FormCreate(TObject *Sender)
{
  // initialize local variables...
  Changing = false;
  DeltaA = 2;
  DeltaB = 2;
  DeltaC = 6;
  DeltaD = 6;
  a = 3.0;
  b = 10.0;
  c = 5.0;
  d = 1.0;
  ScrollBar4->Position = 100;
  Formula = 0;
  TeeCommander1->ButtonRotate->Down = true;
  // add the surface...
  Fill();
}
//---------------------------------------------------------------------------
// return a surface cell value...
double TOpenGLSurface::Calc(double x, double y)
{
  double Res;
  switch (Formula)
  {
    case 0:
          {
            x = x/3.0;
            y = y/3.0;
            Res =  a*pow(d-x,2)*exp(-(x*x)-pow(y+d,2))
                      -b*(x/c-(x*x*x)-(y*y*y*y*y))*exp(-pow(x,2)-pow(y,2))
                      -(d/a)*exp(-pow(x+d,2)-pow(y,2));
          } break;
    case 1:
          {
            x =(x/15.0)*random(100)/100.0;
            y = (y/15.0)*random(100)/100.0;
            Res = cos(x+pow(y,2)+a*b*c*d);
          } break;
    case 2:
          {
            x = (x/15.0)*M_PI/3.0;
            y = (y/15.0)*M_PI;
            Res = cos(pow(a,2)+x*sin(y)+sin(pow(b,2)+x)*pow(cos(pow(c*d+y,2)),2));;
          } break;
    default : Res = 0.0;
  }
  return Res;
}
//---------------------------------------------------------------------------
void TOpenGLSurface::Fill()
{
  // do a loop and fill a 21 x 21 surface...
  if (!this->Changing)
  {
    Series1->Clear();
    for (int i=-10; i<10; i++)
      for (int j=-10; j<10; j++) Series1->AddXYZ(i,Calc(i,j), j, "", clTeeColor);

    if (CheckBox2->Checked) Series1->PaletteSteps = 32;
  }
  // show the formula parameters...
  Label1->Caption = FloatToStr(a);
  Label2->Caption = FloatToStr(b);
  Label3->Caption = FloatToStr(c);
  Label4->Caption = FloatToStr(d);
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::ScrollBar2Change(TObject *Sender)
{
  a = ScrollBar2->Position/100.0;
  Fill();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::ScrollBar3Change(TObject *Sender)
{
  b = ScrollBar3->Position/100.0;
  Fill();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::ScrollBar4Change(TObject *Sender)
{
  c = ScrollBar4->Position/100.0;
  Fill();
}
//---------------------------------------------------------------------------
void __fastcall TOpenGLSurface::ScrollBar5Change(TObject *Sender)
{
  d = ScrollBar5->Position/100.0;
  Fill();
}
//---------------------------------------------------------------------------
void __fastcall TOpenGLSurface::FormClose(TObject *Sender,
      TCloseAction &Action)
{
  Timer1->Enabled == false;

}
//---------------------------------------------------------------------------
// use OpenGL native API to add an extra "light" to the scene }
void AddExtraLight(const double Ambient,const double Diffuse,const double Specular,
        const double X,const double Y,const double Z)
{
  GLMat tmp;
  glEnable(GL_LIGHT1);

  tmp[0] =Ambient;
  tmp[1] =Ambient;
  tmp[2] =Ambient;
  tmp[3] = 1;
  glLightfv(GL_LIGHT1,  GL_AMBIENT, tmp);

  tmp[0] = Diffuse;
  tmp[1] = Diffuse;
  tmp[2] = Diffuse;
  tmp[3] = 1;
  glLightfv(GL_LIGHT1,  GL_DIFFUSE, tmp);

  tmp[0] = Specular;
  tmp[1] = Specular;
  tmp[2] = Specular;
  tmp[3] = 1;
  glLightfv(GL_LIGHT1,  GL_SPECULAR, tmp);

  tmp[0] =  200;
  tmp[1] =  100;
  tmp[2] = -150;
  tmp[3] =  1;
  glLightfv(GL_LIGHT1, GL_POSITION, tmp);
}

void DisableExtraLight()
{
  glDisable(GL_LIGHT1);
}
void __fastcall TOpenGLSurface::TeeOpenGL1Init(TObject *Sender)
{
  if (CheckBox7->Checked) AddExtraLight(0.6,0.2,0.9,200,100,-150);
  else DisableExtraLight();
}
//---------------------------------------------------------------------------

void ChangeScroll(TScrollBar *ABar, int &ADelta)
{
  if (ABar->Position + ADelta < ABar->Min || ABar->Position + ADelta > ABar->Max)
    ADelta = - ADelta;
  else ABar->Position += ADelta;
}
void __fastcall TOpenGLSurface::Timer1Timer(TObject *Sender)
{
  // animation...
  Timer1->Enabled = false;
  Changing = true;
  ChangeScroll(ScrollBar2,DeltaA);
  ChangeScroll(ScrollBar3,DeltaB);
  ChangeScroll(ScrollBar4,DeltaC);
  ChangeScroll(ScrollBar5,DeltaD);
  Changing = false;
  Fill();
  TView3DOptions *opt = Chart1->View3DOptions;
  opt->Rotation += 1;
  if (opt->Rotation > 360) opt->Rotation -= 360;
  Timer1->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::CheckBox3Click(TObject *Sender)
{
  Chart1->View3DWalls = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::CheckBox4Click(TObject *Sender)
{
  Series1->Pen->Visible = CheckBox4->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::RadioGroup1Click(TObject *Sender)
{
  Formula = RadioGroup1->ItemIndex;
  Fill();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::CheckBox5Click(TObject *Sender)
{
  Chart1->AxisVisible = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::CheckBox6Click(TObject *Sender)
{
  Series1->WireFrame = !CheckBox6->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::CheckBox2Click(TObject *Sender)
{
  Series1->UsePalette = CheckBox2->Checked;
  Series1->UseColorRange = !CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLSurface::TrackBar1Change(TObject *Sender)
{
  // change the light "spot" parameter...
  TeeDefaultLightSpot = TrackBar1->Position;
  if (TeeDefaultLightSpot == 91) TeeDefaultLightSpot = 180;

  Chart1->Repaint();

}
//---------------------------------------------------------------------------

