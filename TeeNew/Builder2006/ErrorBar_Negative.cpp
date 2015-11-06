//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ErrorBar_Negative.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "ErrorBar"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TErrorBarNegativeForm *ErrorBarNegativeForm;
//---------------------------------------------------------------------------
__fastcall TErrorBarNegativeForm::TErrorBarNegativeForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TErrorBarNegativeForm::FormCreate(TObject *Sender)
{
  Series1->Clear();
  Series1->AddErrorBar(0,-123,23,"",clTeeColor);
  Series1->AddErrorBar(1,432,65,"",clTeeColor);
  Series1->AddErrorBar(2,-88,13,"",clTeeColor);
  Series1->AddErrorBar(3,222,44,"",clTeeColor);
  Series1->AddErrorBar(4,-321,49,"",clTeeColor);
}
//---------------------------------------------------------------------------

void __fastcall TErrorBarNegativeForm::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

