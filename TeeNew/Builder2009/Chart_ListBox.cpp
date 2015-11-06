//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_ListBox.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartListBoxForm *ChartListBoxForm;
//---------------------------------------------------------------------------
__fastcall TChartListBoxForm::TChartListBoxForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartListBoxForm::CheckBox2Click(TObject *Sender)
{
  ChartListBox1->EnableChangeType = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox1Click(TObject *Sender)
{
  ChartListBox1->EnableChangeColor = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox3Click(TObject *Sender)
{
  ChartListBox1->EnableDragSeries = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  Series2->FillSampleValues(8);
  Series3->FillSampleValues(8);
  Series4->FillSampleValues(8);
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox4Click(TObject *Sender)
{
  ChartListBox1->AllowDeleteSeries = CheckBox4->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox5Click(TObject *Sender)
{
  ChartListBox1->AllowAddSeries = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox6Click(TObject *Sender)
{
  ChartListBox1->ShowSeriesIcon = CheckBox6->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox8Click(TObject *Sender)
{
  ChartListBox1->ShowSeriesColor = CheckBox8->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox9Click(TObject *Sender)
{
  ChartListBox1->ShowSeriesTitle = CheckBox9->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxForm::CheckBox7Click(TObject *Sender)
{
  ChartListBox1->ShowActiveCheck = CheckBox7->Checked;
}
//---------------------------------------------------------------------------

