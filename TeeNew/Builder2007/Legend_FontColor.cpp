//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_FontColor.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLegendFontColor *LegendFontColor;
//---------------------------------------------------------------------------
__fastcall TLegendFontColor::TLegendFontColor(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendFontColor::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->FontSeriesColor = CheckBox1->Checked;
  if (CheckBox1->Checked) Chart1->Legend->Font->Shadow->Color = clBlack;
  else Chart1->Legend->Font->Shadow->Color = clWhite;
}
//---------------------------------------------------------------------------

void __fastcall TLegendFontColor::CheckBox2Click(TObject *Sender)
{
  Series2->Active = CheckBox2->Checked;
  Series3->Active = CheckBox2->Checked;
  Series4->Active = CheckBox2->Checked;

  Series1->ColorEachPoint = !CheckBox2->Checked;

}
//---------------------------------------------------------------------------

void __fastcall TLegendFontColor::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(10);
  Series3->FillSampleValues(10);
  Series4->FillSampleValues(10);
}
//---------------------------------------------------------------------------

