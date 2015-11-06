//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdlib.h>
#pragma hdrstop

#include "Candle_AxisLabels.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TCandleAxisLabels *CandleAxisLabels;
//---------------------------------------------------------------------------
__fastcall TCandleAxisLabels::TCandleAxisLabels(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCandleAxisLabels::FormCreate(TObject *Sender)
{
  double tmpOpen,tmpClose;
  unsigned short tmpYear,tmpMonth,tmpDay;

  // no dates
  Series1->XValues->DateTime = false;

  // fill the candle with random points }
  tmpOpen = random(1000);

  Series1->Clear();
  for (int t=0; t<100;t++)
  {
    tmpOpen = tmpOpen+(random(100)-50);
    tmpClose = tmpOpen-(random(100)-50);

    // add the point
    Series1->AddCandle( t, tmpOpen, tmpOpen+random(10),
                          tmpClose-random(10), tmpClose );

    // set the LABEL to be the date in "yyyymmdd" format
    DecodeDate(Date()+t, tmpYear, tmpMonth, tmpDay );
    Series1->XLabel[ Series1->Count()-1 ] = FormatFloat("0000",tmpYear)+
                                        FormatFloat("00",tmpMonth)+
                                        FormatFloat("00",tmpDay);
  }
}
//---------------------------------------------------------------------------

void __fastcall TCandleAxisLabels::Chart1GetAxisLabel(TChartAxis *Sender,
      TChartSeries *Series, int ValueIndex, AnsiString &LabelText)
{
  int tmpM;
  // show the month name or the day number

  if (Sender == Series1->GetHorizAxis)
    if (Series1->Count() > 0 && ValueIndex!=-1)
    {
      if (Sender->Maximum-Sender->Minimum >30) // more than one month
      {
        tmpM =StrToInt(Series1->XLabel[ValueIndex].SubString(5,2));
        // first label
        if (ValueIndex == 0) LabelText = ShortMonthNames[tmpM];
        else // other labels
          if (StrToInt(Series1->XLabel[ValueIndex-1].SubString(5,2)) !=tmpM) LabelText=ShortMonthNames[tmpM];
          else LabelText ="";
      }
      else // just day-of-the-month numbers
        LabelText = Series1->XLabel[ValueIndex-1].SubString(7,2);
    }
}
//---------------------------------------------------------------------------

