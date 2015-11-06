//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_CursorProg.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TCursorToolProg *CursorToolProg;
//---------------------------------------------------------------------------
__fastcall TCursorToolProg::TCursorToolProg(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCursorToolProg::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolProg::ButtonLeftClick(TObject *Sender)
{
  ChartTool1->XValue=ChartTool1->XValue-1;
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolProg::ButtonRightClick(TObject *Sender)
{
  ChartTool1->XValue=ChartTool1->XValue+1;
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolProg::ButtonTopClick(TObject *Sender)
{
  ChartTool1->YValue=ChartTool1->YValue+SomeValue();
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolProg::ButtonBottomClick(TObject *Sender)
{
  ChartTool1->YValue=ChartTool1->YValue-SomeValue();
}
//---------------------------------------------------------------------------
double __fastcall TCursorToolProg::SomeValue(void)
{
  return (Series1->YValues->MaxValue-Series1->YValues->MinValue)/10.0;
}


