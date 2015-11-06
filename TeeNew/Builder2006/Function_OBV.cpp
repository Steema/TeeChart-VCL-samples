//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_OBV.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "TeeOBVFunction"
#pragma resource "*.dfm"
TOBVFuncDemo *OBVFuncDemo;
//---------------------------------------------------------------------------
__fastcall TOBVFuncDemo::TOBVFuncDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TOBVFuncDemo::FormCreate(TObject *Sender)
{
  // Prepare OBV function:
  TeeFunction1->Volume = Series2;

  // Other properties set at design-time:
  // Series3->SetFunction(TeeFunction1);
  // Series3->DataSource = Series1;

  // Sample random Candle and Volume values...
  Series1->FillSampleValues(40);
  Series2->FillSampleValues(40);

  TeeFunction1->ReCalculate();
}
//---------------------------------------------------------------------------

