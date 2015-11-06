//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Smoothing.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSpline"
#pragma resource "*.dfm"
TSmoothingFunctionDemo *SmoothingFunctionDemo;
//---------------------------------------------------------------------------
__fastcall TSmoothingFunctionDemo::TSmoothingFunctionDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSmoothingFunctionDemo::CheckBox3Click(TObject *Sender)
{
  Series1->Pointer->Visible = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSmoothingFunctionDemo::CheckBox2Click(TObject *Sender)
{
  Series1->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSmoothingFunctionDemo::CheckBox1Click(TObject *Sender)
{
  TeeFunction1->Interpolate = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSmoothingFunctionDemo::Edit2Change(TObject *Sender)
{
  TeeFunction1->Factor = UDFactor->Position;
}
//---------------------------------------------------------------------------

void __fastcall TSmoothingFunctionDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

void __fastcall TSmoothingFunctionDemo::Button2Click(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

