//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Custom.h"
#include <math.h>
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TCustomFunctionDemo *CustomFunctionDemo;
//---------------------------------------------------------------------------
__fastcall TCustomFunctionDemo::TCustomFunctionDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCustomFunctionDemo::TeeFunction1Calculate(
      TCustomTeeFunction *Sender, const double x, double &y)
{
  y = sin((double)x/10.0);
}
//---------------------------------------------------------------------------

void __fastcall TCustomFunctionDemo::Button1Click(TObject *Sender)
{
  EditSeriesDataSource(this,Series1);
}
//---------------------------------------------------------------------------

