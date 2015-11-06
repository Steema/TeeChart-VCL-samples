//---------------------------------------------------------------------------

#include <vcl.h>
#include <EditChar.hpp>
#pragma hdrstop

#include "Axis_Custom.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisCustom *AxisCustom;
//---------------------------------------------------------------------------
__fastcall TAxisCustom::TAxisCustom(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisCustom::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  Series2->FillSampleValues(20);
  Series3->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TAxisCustom::CheckBox1Click(TObject *Sender)
{
  TChartCustomAxes *Axes = Chart1->CustomAxes;
  for (int t=0; t< Axes->Count;t++)
  {
    Axes->Items[t]->Visible = CheckBox1->Checked;
  }

}
//---------------------------------------------------------------------------

void __fastcall TAxisCustom::Button1Click(TObject *Sender)
{
  if (Chart1->CustomAxes->Count == 0) EditChartAxis(this,Chart1->LeftAxis);
  else EditChartAxis(this,Chart1->CustomAxes->Items[0]);

}
//---------------------------------------------------------------------------

