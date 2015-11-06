//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Gradient_RadialCenter.h"
#include "TeeEdiGrad.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TGradientRadial *GradientRadial;
//---------------------------------------------------------------------------
__fastcall TGradientRadial::TGradientRadial(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGradientRadial::TrackBar1Change(TObject *Sender)
{
  Chart1->Walls->Back->Gradient->RadialX = TrackBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TGradientRadial::TrackBar2Change(TObject *Sender)
{
  Chart1->Walls->Back->Gradient->RadialY = TrackBar2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TGradientRadial::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Chart1->Walls->Back->Gradient);
}
//---------------------------------------------------------------------------

