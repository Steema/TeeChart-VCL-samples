//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Median.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMedianFunctionDemo *MedianFunctionDemo;
//---------------------------------------------------------------------------
__fastcall TMedianFunctionDemo::TMedianFunctionDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMedianFunctionDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

