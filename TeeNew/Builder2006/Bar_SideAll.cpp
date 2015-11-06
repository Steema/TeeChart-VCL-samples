//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_SideAll.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBarSideAll *BarSideAll;
//---------------------------------------------------------------------------
__fastcall TBarSideAll::TBarSideAll(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarSideAll::RadioGroup1Click(TObject *Sender)
{
  switch (RadioGroup1->ItemIndex)
  {
    case 0: Series1->MultiBar = mbSideAll; break;
    case 1: Series1->MultiBar = mbSide; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TBarSideAll::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
  Series2->FillSampleValues(5);
}
//---------------------------------------------------------------------------

