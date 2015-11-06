//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Cumulative.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeCumu"
#pragma resource "*.dfm"
TCumulativeForm *CumulativeForm;
//---------------------------------------------------------------------------
__fastcall TCumulativeForm::TCumulativeForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCumulativeForm::FormCreate(TObject *Sender)
{
  double vals[10] = {7,5,6,8,2,1,9,3,4,1};
  Series1->AddArray(vals,9);
}
//---------------------------------------------------------------------------

