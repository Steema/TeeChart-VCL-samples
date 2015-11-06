//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "SeriesType_Point.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPointSeriesForm *PointSeriesForm;
//---------------------------------------------------------------------------
__fastcall TPointSeriesForm::TPointSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPointSeriesForm::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPointSeriesForm::CheckBox2Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPointSeriesForm::Timer1Timer(TObject *Sender)
{
  // stop timer
  Timer1->Enabled = false;
  double tmpX;
  // add a new point to each series
  for (int t=0; t< Chart1->SeriesCount(); t++)
  {
    tmpX = Chart1->Series[t]->XValues->Value[1]-Chart1->Series[t]->XValues->Value[0];
    Chart1->Series[t]->Delete(0);
    Chart1->Series[t]->AddXY( Chart1->Series[t]->XValues->Last()+tmpX,
             Chart1->Series[t]->YValues->Last()+random(100)-50,"",clTeeColor);
  }

  // re-enable timer again
  Timer1->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TPointSeriesForm::FormCreate(TObject *Sender)
{
  for (int t=0; t< Chart1->SeriesCount(); t++) Chart1->Series[t]->FillSampleValues(20);
}
//---------------------------------------------------------------------------

