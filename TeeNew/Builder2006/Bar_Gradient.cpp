//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_Gradient.h"
#include <TeeEdiGrad.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBarGradient *BarGradient;
//---------------------------------------------------------------------------
__fastcall TBarGradient::TBarGradient(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarGradient::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TBarGradient::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Series1->Gradient,true);
}
//---------------------------------------------------------------------------

