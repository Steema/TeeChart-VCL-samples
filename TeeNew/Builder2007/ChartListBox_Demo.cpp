//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartListBox_Demo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma resource "*.dfm"
TListBoxForm *ListBoxForm;
//---------------------------------------------------------------------------
__fastcall TListBoxForm::TListBoxForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TListBoxForm::CheckBox4Click(TObject *Sender)
{
  ChartListBox1->ShowSeriesTitle = CheckBox4->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TListBoxForm::CheckBox2Click(TObject *Sender)
{
  ChartListBox1->ShowSeriesColor = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TListBoxForm::CheckBox1Click(TObject *Sender)
{
  ChartListBox1->ShowActiveCheck = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TListBoxForm::CheckBox3Click(TObject *Sender)
{
  ChartListBox1->ShowSeriesIcon = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TListBoxForm::FormCreate(TObject *Sender)
{
  /* fill sample values. Some series are missing intentionally,
    to show at the list-box
  */
  Series1->FillSampleValues(20);
  Series3->FillSampleValues(10);
  Series4->FillSampleValues(20);
  Series6->FillSampleValues(20);
  Series7->FillSampleValues(20);
  Series2->FillSampleValues(6);

  // select the rotate button in the toolbar
  TeeCommander1->ButtonRotate->Down = true;
}
//---------------------------------------------------------------------------

