//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Add.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFunctionAddForm *FunctionAddForm;
//---------------------------------------------------------------------------
__fastcall TFunctionAddForm::TFunctionAddForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFunctionAddForm::FormCreate(TObject *Sender)
{
  double vals[6] = {2,3,5,7,1,4};

  Series1->AddArray(vals, 5);
}
//---------------------------------------------------------------------------

void __fastcall TFunctionAddForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) TeeFunction1->Period = 2;
  else TeeFunction1->Period = 0; // all points
}
//---------------------------------------------------------------------------

