//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Perimeter.h"
#include "StatChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPerimeterDemo *PerimeterDemo;
//---------------------------------------------------------------------------
__fastcall TPerimeterDemo::TPerimeterDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPerimeterDemo::FormCreate(TObject *Sender)
{
  Series2->XValues->Order = loNone;
  Series2->DataSource = Series1;
  Series2->FunctionType = new TPerimeterFunction(this);  // StatChar.pas unit

  Button1Click(this);
}
//---------------------------------------------------------------------------

void __fastcall TPerimeterDemo::Button1Click(TObject *Sender)
{
  randomize();

  Series1->Clear();
  for (int t=0; t<100; t++)
  {
    Series1->AddXY(random(100)*random(10),random(100)*random(10));
  }
  Series2->FunctionType->ReCalculate();
}
//---------------------------------------------------------------------------

