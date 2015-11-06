//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Mode.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TModeFunctionDemo *ModeFunctionDemo;
//---------------------------------------------------------------------------
__fastcall TModeFunctionDemo::TModeFunctionDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TModeFunctionDemo::CheckBox2Click(TObject *Sender)
{
  Series1->IgnoreNulls = !CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TModeFunctionDemo::CheckBox1Click(TObject *Sender)
{
  TeeFunction1->IncludeNulls = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TModeFunctionDemo::FormCreate(TObject *Sender)
{

  // Set some null values for this example...
  Series1->SetNull(11);
  Series1->SetNull(14);
  Series1->SetNull(3);
}
//---------------------------------------------------------------------------

