//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_CLV.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "TeeCLVFunction"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TCLVFuncDemo *CLVFuncDemo;
//---------------------------------------------------------------------------
__fastcall TCLVFuncDemo::TCLVFuncDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCLVFuncDemo::FormCreate(TObject *Sender)
{
  // Prepare CLV function:
  TeeFunction1->Accumulate = true;
  TeeFunction1->Volume = Series2;

  // Other properties set at design-time:
  // Series3->SetFunction(TeeFunction1);
  // Series3->DataSource = Series1;

  // Sample random Candle and Volume values...
  Series1->FillSampleValues(20);
  Series2->FillSampleValues(20);

  TeeFunction1->ReCalculate();
}
//---------------------------------------------------------------------------

void __fastcall TCLVFuncDemo::CheckBox1Click(TObject *Sender)
{
  TeeFunction1->Accumulate = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCLVFuncDemo::CheckBox2Click(TObject *Sender)
{
  if (CheckBox2->Checked) TeeFunction1->Volume = Series2;
  else TeeFunction1->Volume = NULL;

}
//---------------------------------------------------------------------------

