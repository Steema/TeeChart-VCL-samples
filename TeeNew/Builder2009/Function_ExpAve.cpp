//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_ExpAve.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TExpAveForm *ExpAveForm;
//---------------------------------------------------------------------------
__fastcall TExpAveForm::TExpAveForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExpAveForm::TrackBar1Change(TObject *Sender)
{
  TeeFunction1->Weight = TrackBar1->Position/100.0;
  Label2->Caption = FormatFloat("0.00",TeeFunction1->Weight);
}
//---------------------------------------------------------------------------

void __fastcall TExpAveForm::FormCreate(TObject *Sender)
{
  Delta = 2;
  Series1->FillSampleValues(30);
}
//---------------------------------------------------------------------------

void __fastcall TExpAveForm::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TExpAveForm::Timer1Timer(TObject *Sender)
{
  TrackBar1->Position += Delta;
  if (TrackBar1->Position<2 || TrackBar1->Position>98) Delta = -Delta;
}
//---------------------------------------------------------------------------

