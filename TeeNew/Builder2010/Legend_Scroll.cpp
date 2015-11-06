//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Scroll.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TLegendScroll *LegendScroll;
//---------------------------------------------------------------------------
__fastcall TLegendScroll::TLegendScroll(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendScroll::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
  ScrollBar1->Max = Series1->Count()-1;
}
//---------------------------------------------------------------------------

void __fastcall TLegendScroll::ScrollBar1Change(TObject *Sender)
{
  Chart1->Legend->FirstValue = ScrollBar1->Position;
  ChartTool1->Value = ScrollBar1->Position;
  Label2->Caption = IntToStr(Chart1->Legend->FirstValue);
}
//---------------------------------------------------------------------------

void __fastcall TLegendScroll::ChartTool1EndDragLine(
      TColorLineTool *Sender)
{
  ScrollBar1Change(this);
}
//---------------------------------------------------------------------------

