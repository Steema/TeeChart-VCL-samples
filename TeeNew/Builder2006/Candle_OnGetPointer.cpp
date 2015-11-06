//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Candle_OnGetPointer.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TCandleOnGetPointer *CandleOnGetPointer;
//---------------------------------------------------------------------------
__fastcall TCandleOnGetPointer::TCandleOnGetPointer(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCandleOnGetPointer::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TCandleOnGetPointer::CheckBox1Click(TObject *Sender)
{
  Series1->Repaint();
}
//---------------------------------------------------------------------------

TSeriesPointerStyle __fastcall TCandleOnGetPointer::Series1GetPointerStyle(
      TChartSeries *Sender, int ValueIndex)
{
  if (CheckBox1->Checked)
  {
    // change some candle colors...
    if ( ValueIndex % 2 == 0 )
    {
      Series1->Pointer->Pen->Color=clYellow;
      return psRectangle;
    }
    else
    {
      Series1->Pointer->Pen->Color=clBlue;
      return psDiamond;
    }
  }
  else
  {
    Series1->Pointer->Pen->Color=clBlack;
    return psRectangle; // default
  }
}
//---------------------------------------------------------------------------

