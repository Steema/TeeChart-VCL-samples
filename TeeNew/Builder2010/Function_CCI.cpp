//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_CCI.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "TeeCCIFunction"
#pragma resource "*.dfm"
TCCIFuncDemo *CCIFuncDemo;
//---------------------------------------------------------------------------
__fastcall TCCIFuncDemo::TCCIFuncDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCCIFuncDemo::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TCCIFuncDemo::Edit2Change(TObject *Sender)
{
  TeeFunction1->Constant = StrToFloatDef(Edit2->Text,TeeFunction1->Constant);
}
//---------------------------------------------------------------------------

void __fastcall TCCIFuncDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(40); // <--- candle

  Edit2->Text = FloatToStr(TeeFunction1->Constant);
}
//---------------------------------------------------------------------------

