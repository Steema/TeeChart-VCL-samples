//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Correlation.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CurvFitt"
#pragma resource "*.dfm"
TCorrelationFunctionDemo *CorrelationFunctionDemo;
//---------------------------------------------------------------------------
__fastcall TCorrelationFunctionDemo::TCorrelationFunctionDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCorrelationFunctionDemo::CheckBox1Click(TObject *Sender)
{
  Series3->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCorrelationFunctionDemo::Button1Click(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

void __fastcall TCorrelationFunctionDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

