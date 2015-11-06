//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Area_Stairs.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAreaStairsForm *AreaStairsForm;
//---------------------------------------------------------------------------
__fastcall TAreaStairsForm::TAreaStairsForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAreaStairsForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TAreaStairsForm::CheckBox1Click(TObject *Sender)
{
  Series1->Stairs = CheckBox1->Checked;
  Series2->Stairs = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

