//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Candle_CustomColors.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TCandleCustomColors *CandleCustomColors;
//---------------------------------------------------------------------------
__fastcall TCandleCustomColors::TCandleCustomColors(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCandleCustomColors::SetCustomColors()
{
  // some custom colors...
  Series1->ValueColor[11] = clYellow;
  Series1->ValueColor[15] = clLime;
  Series1->ValueColor[16] = clBlue;
}
//---------------------------------------------------------------------------
void __fastcall TCandleCustomColors::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(30);

  SetCustomColors();
}
//---------------------------------------------------------------------------

void __fastcall TCandleCustomColors::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->CandleStyle = csCandleStick; break;
    case 1: Series1->CandleStyle = csCandleBar; break;
    case 2: Series1->CandleStyle = csOpenClose; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TCandleCustomColors::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) SetCustomColors();
  else // reset colors to default...
  {
    for (int t=0; t<Series1->Count();t++) Series1->ValueColor[t] = clTeeColor;
  }
}
//---------------------------------------------------------------------------

void __fastcall TCandleCustomColors::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

