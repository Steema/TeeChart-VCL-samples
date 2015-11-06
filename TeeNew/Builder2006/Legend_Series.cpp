//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Series.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLegendSeriesForm *LegendSeriesForm;
//---------------------------------------------------------------------------
__fastcall TLegendSeriesForm::TLegendSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendSeriesForm::RadioButton1Click(TObject *Sender)
{
  Chart1->Legend->Series = Series1;
}
//---------------------------------------------------------------------------

void __fastcall TLegendSeriesForm::RadioButton2Click(TObject *Sender)
{
  Chart1->Legend->Series = Series2;
}
//---------------------------------------------------------------------------

void __fastcall TLegendSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
  Series2->FillSampleValues(8);
}
//---------------------------------------------------------------------------

