//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_ExtraLegend.h"
#include "TeeEdiLege.hpp" // <-- for this example only, to show legend editor
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeExtraLegendTool"
#pragma resource "*.dfm"
TExtraLegendDemo *ExtraLegendDemo;
//---------------------------------------------------------------------------
__fastcall TExtraLegendDemo::TExtraLegendDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExtraLegendDemo::AlignLegend(void)
{
  // Customize extra legend position.
  // Align with default normal legend.
  ChartTool1->Legend->CustomPosition = true;
  ChartTool1->Legend->Left = Chart1->Legend->Left;
  ChartTool1->Legend->Top = Chart1->Legend->ShapeBounds.Bottom+10;
}
//---------------------------------------------------------------------------
void __fastcall TExtraLegendDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TExtraLegendDemo::Button1Click(TObject *Sender)
{
  TFormTeeLegend *editform = new TFormTeeLegend(this,ChartTool1->Legend);
  try
  {
    editform->ShowModal();
  }
  __finally
  {
    delete editform;
  }
}
//---------------------------------------------------------------------------

void __fastcall TExtraLegendDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
  Series2->FillSampleValues(5);

  ChartTool1->Series = Series2;

  // Cosmetic...
  ChartTool1->Legend->Shadow->Transparency = 70;
  ChartTool1->Legend->CustomPosition = true;
  ChartTool1->Legend->Left = 50;
  ChartTool1->Legend->Top = 50;
}
//---------------------------------------------------------------------------

void __fastcall TExtraLegendDemo::Button2Click(TObject *Sender)
{
  AlignLegend();
}
//---------------------------------------------------------------------------

