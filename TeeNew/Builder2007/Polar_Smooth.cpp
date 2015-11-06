//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Polar_Smooth.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma link "TeeSpline"
#pragma resource "*.dfm"
TPolarSmoothForm *PolarSmoothForm;
//---------------------------------------------------------------------------
__fastcall TPolarSmoothForm::TPolarSmoothForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPolarSmoothForm::CheckBox3Click(TObject *Sender)
{
  TeeFunction1->Interpolate = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPolarSmoothForm::CheckBox1Click(TObject *Sender)
{
  Series1->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPolarSmoothForm::CheckBox2Click(TObject *Sender)
{
  Series2->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

