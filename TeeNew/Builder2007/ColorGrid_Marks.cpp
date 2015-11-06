//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorGrid_Marks.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TColorGridMarks *ColorGridMarks;
//---------------------------------------------------------------------------
__fastcall TColorGridMarks::TColorGridMarks(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorGridMarks::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
  Series1->CenteredPoints = true;
  Series1->Marks->Style = smsValue;
  Series1->Marks->Visible = true;
  Series1->Marks->Shadow->Transparency = 70;
}
//---------------------------------------------------------------------------

void __fastcall TColorGridMarks::CheckBox1Click(TObject *Sender)
{
  Series1->Marks->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorGridMarks::Button1Click(TObject *Sender)
{
  EditSeriesMarks(this,Series1);
  CheckBox1->Checked = Series1->Marks->Visible;
}
//---------------------------------------------------------------------------

void __fastcall TColorGridMarks::CheckBox2Click(TObject *Sender)
{
  Series1->CenteredPoints = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

