//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Wall_Transparency.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma link "TeeOpenGL"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TWallTransparency *WallTransparency;
//---------------------------------------------------------------------------
__fastcall TWallTransparency::TWallTransparency(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TWallTransparency::Button1Click(TObject *Sender)
{
  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TWallTransparency::ScrollBar1Change(TObject *Sender)
{
  // Set transparency to all walls
  Chart1->Walls->Left->Transparency = ScrollBar1->Position;
  Chart1->Walls->Right->Transparency = ScrollBar1->Position;
  Chart1->Walls->Bottom->Transparency = ScrollBar1->Position;
  Chart1->Walls->Back->Transparency = ScrollBar1->Position;

  Label2->Caption = IntToStr(ScrollBar1->Position);
}
//---------------------------------------------------------------------------
double __fastcall TWallTransparency::Calc(double x, double y)
{
  // Example of complex surface...
  double a = 3.0;
  double b = 10.0;
  double c = 5.0;
  double d = 1.0;
  x = x/3.0;
  y = y/3.0;
  double res =  a*pow(d-x,2)*exp(-(x*x)-pow(y+d,2))
              -b*(x/c-(x*x*x)-(y*y*y*y*y))*exp(-pow(x,2)-pow(y,2))
              -(d/a)*exp(-pow(x+d,2)-pow(y,2));

  return res;
}
//---------------------------------------------------------------------------
void __fastcall TWallTransparency::FormCreate(TObject *Sender)
{
  // Fill surface
  for (int x=-10; x<10; x++)
    for (int z=-10; z<10; z++)
      Series1->AddXYZ(x,Calc(x,z),z);
}
//---------------------------------------------------------------------------

