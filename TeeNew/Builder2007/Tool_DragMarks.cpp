//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_DragMarks.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TDragMarksToolDemo *DragMarksToolDemo;
//---------------------------------------------------------------------------
__fastcall TDragMarksToolDemo::TDragMarksToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDragMarksToolDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDragMarksToolDemo::Button1Click(TObject *Sender)
{
  Series1->Marks->ResetPositions();
  Series2->Marks->ResetPositions();
}
//---------------------------------------------------------------------------

void __fastcall TDragMarksToolDemo::Button2Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TDragMarksToolDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series1->Marks->ArrowLength = 10;
  Series2->FillSampleValues(6);
}
//---------------------------------------------------------------------------

