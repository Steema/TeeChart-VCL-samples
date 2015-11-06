//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Candle_OpenClose.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TCandleOpenClose *CandleOpenClose;
//---------------------------------------------------------------------------
__fastcall TCandleOpenClose::TCandleOpenClose(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCandleOpenClose::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  Series1->CandleStyle = csOpenClose;
}
//---------------------------------------------------------------------------

void __fastcall TCandleOpenClose::RadioGroup1Click(TObject *Sender)
{
  switch (RadioGroup1->ItemIndex)
  {
    case 0: Series1->CandleStyle = csCandleStick; break;
    case 1: Series1->CandleStyle = csCandleBar; break;
    case 2: Series1->CandleStyle = csOpenClose; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TCandleOpenClose::CheckBox1Click(TObject *Sender)
{
  Series1->Pointer->Draw3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

