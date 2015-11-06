//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FastLine_Nulls.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFastLineNulls *FastLineNulls;
//---------------------------------------------------------------------------
__fastcall TFastLineNulls::TFastLineNulls(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFastLineNulls::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(50);

  // set some null points:
  Series1->SetNull(14);
  Series1->SetNull(20);
  Series1->SetNull(31);
  Series1->SetNull(39);

  // allow nulls:
  // (this property is False by default, for speed reasons)
  Series1->IgnoreNulls = false;

  // Draw in "stairs" mode:
  Series1->Stairs = true;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineNulls::CheckBox1Click(TObject *Sender)
{
  Series1->Stairs = CheckBox1->Checked;

  // enable / disable
  CheckBox3->Enabled = Series1->Stairs;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineNulls::CheckBox3Click(TObject *Sender)
{
  Series1->InvertedStairs = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineNulls::CheckBox2Click(TObject *Sender)
{
  Series1->IgnoreNulls = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

