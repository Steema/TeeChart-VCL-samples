//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Low.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLowForm *LowForm;
//---------------------------------------------------------------------------
__fastcall TLowForm::TLowForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLowForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) TeeFunction1->Period = 2;
  else TeeFunction1->Period = 0; // all points
}
//---------------------------------------------------------------------------

void __fastcall TLowForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);        
}
//---------------------------------------------------------------------------

