//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Scrollbar.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeLegendScrollBar"
#pragma resource "*.dfm"
TLegendScrollBarDemo *LegendScrollBarDemo;
//---------------------------------------------------------------------------
__fastcall TLegendScrollBarDemo::TLegendScrollBarDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendScrollBarDemo::Button1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TLegendScrollBarDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(50);
}
//---------------------------------------------------------------------------

void __fastcall TLegendScrollBarDemo::ChartTool1Scrolled(TObject *Sender)
{
  Label2->Caption = IntToStr(Chart1->Legend->FirstValue);
}
//---------------------------------------------------------------------------

