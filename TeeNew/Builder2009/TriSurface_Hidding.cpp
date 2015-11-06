//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TriSurface_Hidding.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma link "math"
#pragma link "TeeTriSurface"
#pragma resource "*.dfm"
TTriSurfaceHidding *TriSurfaceHidding;
//---------------------------------------------------------------------------
__fastcall TTriSurfaceHidding::TTriSurfaceHidding(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTriSurfaceHidding::FormCreate(TObject *Sender)
{
  Series1->HideTriangles=CheckBox1->Checked;
  Series1->CacheTriangles=CheckBox2->Checked;

  Fill();
}
//---------------------------------------------------------------------------

void __fastcall TTriSurfaceHidding::CheckBox1Click(TObject *Sender)
{
  Series1->HideTriangles=CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TTriSurfaceHidding::CheckBox2Click(TObject *Sender)
{
  Series1->CacheTriangles=CheckBox2->Checked;
}
//---------------------------------------------------------------------------
double sqr(const double Value)
{
  return Value*Value;
}

void __fastcall TTriSurfaceHidding::Fill(void)
{
   double n;
   int m,x,z;

   Series1->Clear();
   n=0.5;
   m=10;
   for ( x=-m; x<=m; x++ )
    for ( z=-m; z<=m; z++ )
     Series1->AddXYZ(x,
        4.0*cos (3*sqrt(sqr(x/3.0) + sqr(z/3.0)))*
        exp(-n*(sqrt(sqr(x/3.0) + sqr(z/3.0)))),
                  z,"",clTeeColor);
}


