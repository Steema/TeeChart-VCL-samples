//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "SeriesType_Line.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLineSeriesForm *LineSeriesForm;
//---------------------------------------------------------------------------
__fastcall TLineSeriesForm::TLineSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLineSeriesForm::CheckBox1Click(TObject *Sender)
{
  Series1->Stairs = CheckBox1->Checked;
  Series2->Stairs = Series1->Stairs;
}
//---------------------------------------------------------------------------

void __fastcall TLineSeriesForm::FormCreate(TObject *Sender)
{
  randomize();
  
  Series1->Clear();
  for (int t=1; t<20; t++) Series1->Add( random(100), "", clTeeColor );
  Series1->ValueColor[3] = clNone;   // <-- null point example

  for (int t=1; t<20; t++) Series2->Add( random(100), "", clTeeColor );
  Series2->ValueColor[10] = clNone;  // <-- null point example
}
//---------------------------------------------------------------------------

void __fastcall TLineSeriesForm::CheckBox2Click(TObject *Sender)
{
  Series1->Marks->Visible = CheckBox2->Checked;
  Series2->Marks->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLineSeriesForm::CheckBox3Click(TObject *Sender)
{
  Series1->Pointer->Visible = CheckBox3->Checked;
  Series2->Pointer->Visible = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLineSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this, Series1);
}
//---------------------------------------------------------------------------

void __fastcall TLineSeriesForm::CheckBox4Click(TObject *Sender)
{
  if (CheckBox4->Checked) Series1->Stacked = cssStack;
  else Series1->Stacked = cssNone;
}
//---------------------------------------------------------------------------

void __fastcall TLineSeriesForm::CheckBox5Click(TObject *Sender)
{
  Chart1->View3D = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

