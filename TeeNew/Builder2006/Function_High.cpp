//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_High.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
THighForm *HighForm;
//---------------------------------------------------------------------------
__fastcall THighForm::THighForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THighForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) TeeFunction1->Period = 2;
  else TeeFunction1->Period = 0; // all points
}
//---------------------------------------------------------------------------

void __fastcall THighForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

