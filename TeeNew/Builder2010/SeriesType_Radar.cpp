//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Radar.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TRadarForm *RadarForm;
//---------------------------------------------------------------------------
__fastcall TRadarForm::TRadarForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRadarForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
  Series2->FillSampleValues(5);
  Series3->FillSampleValues(5);
}
//---------------------------------------------------------------------------

void __fastcall TRadarForm::CheckBox5Click(TObject *Sender)
{
  Chart1->RightAxis->Visible = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRadarForm::CheckBox3Click(TObject *Sender)
{
  Series1->Pen->Visible = CheckBox3->Checked;
  Series2->Pen->Visible = CheckBox3->Checked;
  Series3->Pen->Visible = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRadarForm::CheckBox2Click(TObject *Sender)
{
  Series1->CircleLabels = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRadarForm::CheckBox1Click(TObject *Sender)
{
  Series1->Circled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

