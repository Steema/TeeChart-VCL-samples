//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_ADX.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TADXFunctionForm *ADXFunctionForm;
//---------------------------------------------------------------------------
__fastcall TADXFunctionForm::TADXFunctionForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TADXFunctionForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TADXFunctionForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(300);
}
//---------------------------------------------------------------------------

