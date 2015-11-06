//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RSI_Function.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "StatChar"
#pragma resource "*.dfm"
TRSICalcForm *RSICalcForm;
//---------------------------------------------------------------------------
__fastcall TRSICalcForm::TRSICalcForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRSICalcForm::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0) TeeFunction1->Style = rsiOpenClose;
  else TeeFunction1->Style = rsiClose;

}
//---------------------------------------------------------------------------

void __fastcall TRSICalcForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TRSICalcForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);

  TeeFunction1->Period = 10;  // take 10 prices
  TeeFunction1->Style = rsiOpenClose;  // default calc method
}
//---------------------------------------------------------------------------

void __fastcall TRSICalcForm::Chart1AllowScroll(TChartAxis *Sender,
      double &AMin, double &AMax, bool &AllowScroll)
{
  AllowScroll = (Sender != Chart1->CustomAxes->Items[0]);
}
//---------------------------------------------------------------------------

void __fastcall TRSICalcForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

