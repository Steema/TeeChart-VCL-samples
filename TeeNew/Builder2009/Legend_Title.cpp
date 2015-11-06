//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Title.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLegendTitleForm *LegendTitleForm;
//---------------------------------------------------------------------------
__fastcall TLegendTitleForm::TLegendTitleForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendTitleForm::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->Title->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLegendTitleForm::Button1Click(TObject *Sender)
{
  EditChartLegend(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TLegendTitleForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

