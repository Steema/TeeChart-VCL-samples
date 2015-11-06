//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Line_Stack.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLineStack *LineStack;
//---------------------------------------------------------------------------
__fastcall TLineStack::TLineStack(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLineStack::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->Stacked = cssNone; break;
    case 1: Series1->Stacked = cssOverlap; break;
    case 2: Series1->Stacked = cssStack; break;
    case 3: Series1->Stacked = cssStack100; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TLineStack::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(10);
  Series3->FillSampleValues(10);
  Series4->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TLineStack::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

