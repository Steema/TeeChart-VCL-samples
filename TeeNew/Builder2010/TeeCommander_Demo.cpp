//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TeeCommander_Demo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "Bar3D"
#pragma link "TeeComma"
#pragma resource "*.dfm"
TTeeCommanderDemo *TeeCommanderDemo;
//---------------------------------------------------------------------------
__fastcall TTeeCommanderDemo::TTeeCommanderDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTeeCommanderDemo::CheckBox3Click(TObject *Sender)
{
  TeeCommander1->LabelText->Visible = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TTeeCommanderDemo::CheckBox2Click(TObject *Sender)
{
  TeeCommander1->ParentShowHint = false;
  TeeCommander1->ShowHint = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TTeeCommanderDemo::CheckBox1Click(TObject *Sender)
{
  TeeCommander1->Vertical = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TTeeCommanderDemo::CheckBox4Click(TObject *Sender)
{
  if (CheckBox4->Checked) TeeCommander1->Panel = Chart1;
  else TeeCommander1->Panel = NULL;
}
//---------------------------------------------------------------------------

void __fastcall TTeeCommanderDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
}
//---------------------------------------------------------------------------

