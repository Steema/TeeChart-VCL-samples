//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pie_Gradient.h"
#include "TeeEdiGrad.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeDonut"
#pragma resource "*.dfm"
TPieGradientForm *PieGradientForm;
//---------------------------------------------------------------------------
__fastcall TPieGradientForm::TPieGradientForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieGradientForm::CheckBox1Click(TObject *Sender)
{
  Series1->Gradient->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPieGradientForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

void __fastcall TPieGradientForm::Panel1Click(TObject *Sender)
{
  EditTeeGradient(this,Series1->Gradient,true);
}
//---------------------------------------------------------------------------

