//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Trend.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CurvFitt"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TTrendForm *TrendForm;
//---------------------------------------------------------------------------
__fastcall TTrendForm::TTrendForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTrendForm::FormCreate(TObject *Sender)
{
  Button1Click(this);
}
//---------------------------------------------------------------------------

void __fastcall TTrendForm::Button1Click(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

