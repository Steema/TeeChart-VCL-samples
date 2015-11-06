//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "WindRose_AngleInc.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma link "TeeRose"
#pragma resource "*.dfm"
TWindAngleInc *WindAngleInc;
//---------------------------------------------------------------------------
__fastcall TWindAngleInc::TWindAngleInc(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TWindAngleInc::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TWindAngleInc::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->AngleIncrement = 15; break;
    case 1: Series1->AngleIncrement = 30; break;
    case 2: Series1->AngleIncrement = 45; break;
    case 3: Series1->AngleIncrement = 90; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TWindAngleInc::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 1;
}
//---------------------------------------------------------------------------

