//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Circled_Gradient.h"
#include "TeeEdiGrad.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TCircledGradient *CircledGradient;
//---------------------------------------------------------------------------
__fastcall TCircledGradient::TCircledGradient(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCircledGradient::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Series1->CircleGradient);
}
//---------------------------------------------------------------------------

void __fastcall TCircledGradient::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

