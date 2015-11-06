//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_MarksTip.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TMarkTipsToolDemo *MarkTipsToolDemo;
//---------------------------------------------------------------------------
__fastcall TMarkTipsToolDemo::TMarkTipsToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarkTipsToolDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TMarkTipsToolDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  Application->HintPause = 10;
}
//---------------------------------------------------------------------------

void __fastcall TMarkTipsToolDemo::Button1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TMarkTipsToolDemo::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex ==0) ChartTool1->MouseAction = mtmMove;
  else ChartTool1->MouseAction = mtmClick;
}
//---------------------------------------------------------------------------

void __fastcall TMarkTipsToolDemo::Edit1Change(TObject *Sender)
{
  Application->HintPause = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TMarkTipsToolDemo::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

