//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Inspector_Demo.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeInspector"
#pragma resource "*.dfm"
TInspectorForm *InspectorForm;
//---------------------------------------------------------------------------
__fastcall TInspectorForm::TInspectorForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TInspectorForm::FormCreate(TObject *Sender)
{
  // Initialize inspector values:
  TeeInspector1->Items->Item[0]->Value = Chart1->Color;
  TeeInspector1->Items->Item[1]->Value = Chart1->Title->Font->Size;
  TeeInspector1->Items->Item[2]->Value = Chart1->Title->Visible;
  TeeInspector1->Items->Item[4]->Data = Chart1->Gradient;
}
//---------------------------------------------------------------------------

void __fastcall TInspectorForm::TeeInspector1Items0Change(TObject *Sender)
{
  int c= TeeInspector1->Items->Item[0]->Value;
  Chart1->Color = (TColor)c;
}
//---------------------------------------------------------------------------

void __fastcall TInspectorForm::TeeInspector1Items1Change(TObject *Sender)
{
  Chart1->Title->Font->Size = TeeInspector1->Items->Item[1]->Value;
}
//---------------------------------------------------------------------------

void __fastcall TInspectorForm::TeeInspector1Items2Change(TObject *Sender)
{
  Chart1->Title->Visible = TeeInspector1->Items->Item[2]->Value;
}
//---------------------------------------------------------------------------

void __fastcall TInspectorForm::TeeInspector1Items3Change(TObject *Sender)
{
  EditChart(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TInspectorForm::TeeInspector1Items4Change(TObject *Sender)
{
  TeeInspector1->Header->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

