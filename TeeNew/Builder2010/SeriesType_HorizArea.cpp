//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_HorizArea.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
THorizAreaSeriesForm *HorizAreaSeriesForm;
//---------------------------------------------------------------------------
__fastcall THorizAreaSeriesForm::THorizAreaSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THorizAreaSeriesForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0 : Series1->MultiArea = Series::maNone; break;
    case 1 : Series1->MultiArea = Series::maStacked; break;
    case 2 : Series1->MultiArea = Series::maStacked100; break;
  }
  // remove "Marks" when stacking...
  Series1->Marks->Visible = Series1->MultiArea==Series::maNone;
  Series2->Marks->Visible = Series2->MultiArea==Series::maNone;
  Series3->Marks->Visible = Series3->MultiArea==Series::maNone;
}
//---------------------------------------------------------------------------

void __fastcall THorizAreaSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall THorizAreaSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall THorizAreaSeriesForm::CheckBox2Click(TObject *Sender)
{
  Chart1->View3D = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall THorizAreaSeriesForm::CheckBox1Click(TObject *Sender)
{
  Series1->Stairs = CheckBox1->Checked;
  Series2->Stairs = CheckBox1->Checked;
  Series3->Stairs = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

