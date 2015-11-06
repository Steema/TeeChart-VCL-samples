//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Axes.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartAxesForm *ChartAxesForm;
//---------------------------------------------------------------------------
__fastcall TChartAxesForm::TChartAxesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartAxesForm::CheckBox1Click(TObject *Sender)
{
  Chart1->AxisVisible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::CheckBox2Click(TObject *Sender)
{
  for (int t=0; t< Chart1->Axes->Count; t++)
     Chart1->Axes->Items[t]->Grid->Visible = CheckBox2->Checked;

  CheckBox5->Enabled = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::CheckBox4Click(TObject *Sender)
{
  Chart1->DepthAxis->Visible = CheckBox4->Checked;
  if (CheckBox4->Checked) Chart1->MarginRight = 15;
  else Chart1->MarginRight = 3;
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::CheckBox5Click(TObject *Sender)
{
  Chart1->AxisBehind = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::CheckBox6Click(TObject *Sender)
{
  Chart1->View3D = CheckBox6->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->HorizAxis = aTopAxis; break;
    case 1: Series1->HorizAxis = aBottomAxis; break;
    default :  Series1->HorizAxis = aBothHorizAxis;
  }
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::ComboBox2Change(TObject *Sender)
{
  switch (ComboBox2->ItemIndex)
  {
    case 0: Series1->VertAxis = aLeftAxis; break;
    case 1: Series1->VertAxis = aRightAxis; break;
    default :  Series1->VertAxis = aBothVertAxis;
  }

}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::Button1Click(TObject *Sender)
{
  EditChartAxis(this,Chart1->LeftAxis);
}
//---------------------------------------------------------------------------

void __fastcall TChartAxesForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 1;
  ComboBox2->ItemIndex = 0;
}
//---------------------------------------------------------------------------

