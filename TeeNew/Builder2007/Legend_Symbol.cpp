//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Symbol.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TLegendSymbolForm *LegendSymbolForm;
//---------------------------------------------------------------------------
__fastcall TLegendSymbolForm::TLegendSymbolForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendSymbolForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series1->ValueFormat = "0.000";
}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolForm::Edit1Change(TObject *Sender)
{
  Chart1->Legend->Symbol->Width = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolForm::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0) Chart1->Legend->Symbol->Position = spLeft;
  else Chart1->Legend->Symbol->Position = spRight;

}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolForm::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->Symbol->Continuous = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

