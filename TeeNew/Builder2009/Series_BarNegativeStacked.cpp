//---------------------------------------------------------------------------

#include <vcl.h>
#include <sysopen.h>
#pragma hdrstop

#include "Series_BarNegativeStacked.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TBarStackNegative *BarStackNegative;
//---------------------------------------------------------------------------
__fastcall TBarStackNegative::TBarStackNegative(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarStackNegative::FormCreate(TObject *Sender)
{

  double vals1[5] = {23, -56, 42, 9, -8};
  Series1->AddArray(vals1,4);
  double vals2[5] = {32, -16, 9, 39, -28};
  Series2->AddArray(vals2,4);
  double vals3[5] = {12, -21, 14, 22, -13};
  Series3->AddArray(vals3,4);
}
//---------------------------------------------------------------------------

