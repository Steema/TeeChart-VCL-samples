//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_Callout.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksCallouts *MarksCallouts;
//---------------------------------------------------------------------------
__fastcall TMarksCallouts::TMarksCallouts(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksCallouts::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series1->Marks->Callout->Style=psDownTriangle;
  CBArrowStyle->ItemIndex = 3;
}
//---------------------------------------------------------------------------

void __fastcall TMarksCallouts::CBArrowStyleChange(TObject *Sender)
{
  Series1->Marks->Callout->Style = (TSeriesPointerStyle)CBArrowStyle->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TMarksCallouts::Button1Click(TObject *Sender)
{
  EditSeriesMarks(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TMarksCallouts::CheckBox1Click(TObject *Sender)
{
  Series1->Marks->Callout->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

