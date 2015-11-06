//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_TextStyle.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLegendStyleForm *LegendStyleForm;
//---------------------------------------------------------------------------
__fastcall TLegendStyleForm::TLegendStyleForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendStyleForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0 : Chart1->Legend->TextStyle = ltsPercent; break;
    case 1 : Chart1->Legend->TextStyle = ltsXAndValue; break;
    case 2 : Chart1->Legend->TextStyle = ltsXAndPercent; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TLegendStyleForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
  Chart1->Legend->TextStyle = ltsPercent;
}
//---------------------------------------------------------------------------

void __fastcall TLegendStyleForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

