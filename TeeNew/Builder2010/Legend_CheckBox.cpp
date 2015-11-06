//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_CheckBox.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "ErrorBar"
#pragma link "StatChar"
#pragma resource "*.dfm"
TLegendCheckbox *LegendCheckbox;
//---------------------------------------------------------------------------
__fastcall TLegendCheckbox::TLegendCheckbox(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendCheckbox::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->CheckBoxes = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLegendCheckbox::FormCreate(TObject *Sender)
{
  for (int t=0; t<Chart1->SeriesCount(); t++)
  {
    Chart1->Series[t]->FillSampleValues(Chart1->Series[t]->NumSampleValues());
  }
}
//---------------------------------------------------------------------------

