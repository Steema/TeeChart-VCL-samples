//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_MovAveWeighted.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TMovAveWeightedForm *MovAveWeightedForm;
//---------------------------------------------------------------------------
__fastcall TMovAveWeightedForm::TMovAveWeightedForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMovAveWeightedForm::CheckBox1Click(TObject *Sender)
{
  MovingAverageFunction1->Weighted = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TMovAveWeightedForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
}
//---------------------------------------------------------------------------

