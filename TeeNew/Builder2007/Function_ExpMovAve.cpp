//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_ExpMovAve.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "StatChar"
#pragma resource "*.dfm"
TExpMovAveForm *ExpMovAveForm;
//---------------------------------------------------------------------------
__fastcall TExpMovAveForm::TExpMovAveForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExpMovAveForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TExpMovAveForm::FormCreate(TObject *Sender)
{
  Delta = 1;
  Series2->YValues->ValueSource = "Close";
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TExpMovAveForm::ComboBox1Change(TObject *Sender)
{
  Series2->YValues->ValueSource = ComboBox1->Items->Strings[ComboBox1->ItemIndex];
}
//---------------------------------------------------------------------------

void __fastcall TExpMovAveForm::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TExpMovAveForm::Timer1Timer(TObject *Sender)
{
  UpDown1->Position += Delta;
  if (UpDown1->Position > 19 || UpDown1->Position < 2) Delta = -Delta;
}
//---------------------------------------------------------------------------

void __fastcall TExpMovAveForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 3;
}
//---------------------------------------------------------------------------

