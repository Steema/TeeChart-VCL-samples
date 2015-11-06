//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_StdDeviation.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TStdDeviationForm *StdDeviationForm;
//---------------------------------------------------------------------------
__fastcall TStdDeviationForm::TStdDeviationForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TStdDeviationForm::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0) TeeFunction1->Complete = false;
  else TeeFunction1->Complete = true;

}
//---------------------------------------------------------------------------

void __fastcall TStdDeviationForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(30);
}
//---------------------------------------------------------------------------

void __fastcall TStdDeviationForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

