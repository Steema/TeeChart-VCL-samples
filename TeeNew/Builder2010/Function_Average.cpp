//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Average.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAverageForm *AverageForm;
//---------------------------------------------------------------------------
__fastcall TAverageForm::TAverageForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAverageForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TAverageForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) TeeFunction1->Period = 2;
  else TeeFunction1->Period = 0; // all points
}
//---------------------------------------------------------------------------

