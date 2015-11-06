//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Bollinger.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "StatChar"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TBollingerForm *BollingerForm;
//---------------------------------------------------------------------------
__fastcall TBollingerForm::TBollingerForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBollingerForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(400);

  ButtonPen1->LinkPen(Series2->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TBollingerForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TBollingerForm::ButtonPen1Click(TObject *Sender)
{
  TeeFunction1->LowBand->Pen->Assign(Series2->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TBollingerForm::Edit2Change(TObject *Sender)
{
  TeeFunction1->Deviation = UpDown2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TBollingerForm::CheckBox1Click(TObject *Sender)
{
  TeeFunction1->Exponential = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

