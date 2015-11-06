//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Variance.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TVarianceDemo *VarianceDemo;
//---------------------------------------------------------------------------
__fastcall TVarianceDemo::TVarianceDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TVarianceDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

void __fastcall TVarianceDemo::Button1Click(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

