//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartListBox_Radio.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartListBoxRadio *ChartListBoxRadio;
//---------------------------------------------------------------------------
__fastcall TChartListBoxRadio::TChartListBoxRadio(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartListBoxRadio::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
  Series2->FillSampleValues();
  Series3->FillSampleValues();
  Series4->FillSampleValues();
}
//---------------------------------------------------------------------------

void __fastcall TChartListBoxRadio::RadioGroup1Click(TObject *Sender)
{
  if (RadioGroup1->ItemIndex==0) ChartListBox1->CheckStyle = cbsCheck;
  else ChartListBox1->CheckStyle = cbsRadio;
}
//---------------------------------------------------------------------------

