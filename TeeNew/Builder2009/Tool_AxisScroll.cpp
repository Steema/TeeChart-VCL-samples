//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_AxisScroll.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TAxisScrollToolDemo *AxisScrollToolDemo;
//---------------------------------------------------------------------------
__fastcall TAxisScrollToolDemo::TAxisScrollToolDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisScrollToolDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxisScrollToolDemo::CheckBox2Click(TObject *Sender)
{
  ChartTool1->ScrollInverted = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

