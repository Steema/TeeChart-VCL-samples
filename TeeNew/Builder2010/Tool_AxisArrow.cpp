//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_AxisArrow.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TAxisArrowToolDemo *AxisArrowToolDemo;
//---------------------------------------------------------------------------
__fastcall TAxisArrowToolDemo::TAxisArrowToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisArrowToolDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TAxisArrowToolDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxisArrowToolDemo::CheckBox2Click(TObject *Sender)
{
  ChartTool2->Active = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxisArrowToolDemo::Button1Click(TObject *Sender)
{
  EditChart(this,Chart1);
}
//---------------------------------------------------------------------------

