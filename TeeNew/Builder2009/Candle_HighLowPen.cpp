//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Candle_HighLowPen.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TCandleHighLowPen *CandleHighLowPen;
//---------------------------------------------------------------------------
__fastcall TCandleHighLowPen::TCandleHighLowPen(TComponent* Owner)
  : TBaseForm(Owner)
{

  Series1->FillSampleValues(10);

  ButtonPen1->LinkPen(Series1->Pen);
  ButtonPen2->LinkPen(Series1->HighLowPen);

  Series1->HighLowPen->Color = clBlue;
  Series1->HighLowPen->Width = 2;

  Series1->CandleWidth = 8;
}
//---------------------------------------------------------------------------
void __fastcall TCandleHighLowPen::ButtonPen2Click(TObject *Sender)
{
  CheckBox1->Checked = (Series1->HighLowPen->Color == clTeeColor);
}
//---------------------------------------------------------------------------

void __fastcall TCandleHighLowPen::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
    Series1->HighLowPen->Color = clTeeColor;
  else Series1->HighLowPen->Color = clBlue;
}
//---------------------------------------------------------------------------

