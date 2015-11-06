//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Pie.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPieSeriesForm *PieSeriesForm;
//---------------------------------------------------------------------------
__fastcall TPieSeriesForm::TPieSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TPieSeriesForm::CheckBox5Click(TObject *Sender)
{
  if (CheckBox5->Checked)
  {
    Series1->AngleSize = 180;
    CheckBox4->Checked = false;
    CheckBox4Click(this);
  }
  else Series1->AngleSize = 360;
}
//---------------------------------------------------------------------------

void __fastcall TPieSeriesForm::CheckBox4Click(TObject *Sender)
{
  if (CheckBox4->Checked)
  {
    Series1->Shadow->HorizSize = 40;
    Series1->Shadow->VertSize = 40;
  }
  else
  {
    Series1->Shadow->HorizSize = 0;
    Series1->Shadow->VertSize = 0;
  }
}
//---------------------------------------------------------------------------

void __fastcall TPieSeriesForm::CheckBox3Click(TObject *Sender)
{
  Series1->Marks->Visible = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPieSeriesForm::CheckBox2Click(TObject *Sender)
{
  if (CheckBox2->Checked) Series1->ExplodeBiggest = 30;
  else Series1->ExplodeBiggest = 0;
}
//---------------------------------------------------------------------------

void __fastcall TPieSeriesForm::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPieSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

