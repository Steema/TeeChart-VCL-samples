//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Count.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeCount"
#pragma resource "*.dfm"
TCountForm *CountForm;
//---------------------------------------------------------------------------
__fastcall TCountForm::TCountForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCountForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);        
}
//---------------------------------------------------------------------------

