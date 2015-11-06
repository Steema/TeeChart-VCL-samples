//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_RootMeanSq.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TRootMeanSqForm *RootMeanSqForm;
//---------------------------------------------------------------------------
__fastcall TRootMeanSqForm::TRootMeanSqForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRootMeanSqForm::DisplayCalc()
{
  Label2->Caption = FormatFloat("#.##",Series2->YValues->Value[0]);
}
//---------------------------------------------------------------------------
void __fastcall TRootMeanSqForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  DisplayCalc();
}
//---------------------------------------------------------------------------

void __fastcall TRootMeanSqForm::CheckBox1Click(TObject *Sender)
{
  TeeFunction1->Complete = CheckBox1->Checked;
  DisplayCalc();
}
//---------------------------------------------------------------------------

