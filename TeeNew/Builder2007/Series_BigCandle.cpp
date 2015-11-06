//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_BigCandle.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "BigCandl"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TBigCandleForm *BigCandleForm;
//---------------------------------------------------------------------------
__fastcall TBigCandleForm::TBigCandleForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBigCandleForm::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  Series2->Clear();
  int tmp = Series1->Clicked(X,Y);
  if (tmp !=-1)
  {
    Series2->AddCandle( Series1->DateValues->Value[tmp],Series1->OpenValues->Value[tmp],
                        Series1->HighValues->Value[tmp], Series1->LowValues->Value[tmp],
                        Series1->CloseValues->Value[tmp] );
  }
}
//---------------------------------------------------------------------------

void __fastcall TBigCandleForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

