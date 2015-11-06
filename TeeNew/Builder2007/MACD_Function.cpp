//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MACD_Function.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "StatChar"
#pragma resource "*.dfm"
TMACDForm *MACDForm;
//---------------------------------------------------------------------------
__fastcall TMACDForm::TMACDForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMACDForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(120);
}
//---------------------------------------------------------------------------

void __fastcall TMACDForm::CheckBox1Click(TObject *Sender)
{
  Series2->Active =CheckBox1->Checked;

  Chart1->Legend->Visible = CheckBox1->Checked;

  Edit1->Enabled = CheckBox1->Checked;
  UpDown1->Enabled = CheckBox1->Checked;

  // adjust axes...
  Chart1->CustomAxes->Items[0]->Visible = Series2->Active;
  if (Series2->Active) Chart1->LeftAxis->EndPosition = 50;
  else Chart1->LeftAxis->EndPosition = 100;
}
//---------------------------------------------------------------------------

void __fastcall TMACDForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TMACDForm::Edit2Change(TObject *Sender)
{
  TeeFunction1->Period2 = UpDown2->Position;
}
//---------------------------------------------------------------------------

