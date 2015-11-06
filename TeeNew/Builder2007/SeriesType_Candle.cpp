//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Candle.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TCandleForm *CandleForm;
//---------------------------------------------------------------------------
__fastcall TCandleForm::TCandleForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCandleForm::CheckBox1Click(TObject *Sender)
{
  Series1->Pen->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCandleForm::CheckBox2Click(TObject *Sender)
{
  Series1->Draw3D = CheckBox2->Checked;
  Chart1->View3D = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCandleForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  
  ButtonColor1->LinkProperty(Series1,"UpCloseColor");
  ButtonColor2->LinkProperty(Series1,"DownCloseColor");
}
//---------------------------------------------------------------------------

void __fastcall TCandleForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TCandleForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->CandleStyle = csCandleStick; break;
    case 1: Series1->CandleStyle = csCandleBar; break;
    case 2: Series1->CandleStyle = csOpenClose; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TCandleForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

