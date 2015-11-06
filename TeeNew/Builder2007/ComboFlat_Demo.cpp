//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ComboFlat_Demo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TComboFlatForm *ComboFlatForm;
//---------------------------------------------------------------------------
__fastcall TComboFlatForm::TComboFlatForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TComboFlatForm::ComboFlat1Change(TObject *Sender)
{
  Series1->Clear();
  Series1->Add(random(1000),ComboFlat1->Items->Strings[ComboFlat1->ItemIndex],clTeeColor);
  Series1->Marks->Style = smsLabelValue;
}
//---------------------------------------------------------------------------

void __fastcall TComboFlatForm::FormCreate(TObject *Sender)
{
  ComboFlat1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

