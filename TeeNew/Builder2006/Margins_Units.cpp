//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Margins_Units.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartMarginUnits *ChartMarginUnits;
//---------------------------------------------------------------------------
__fastcall TChartMarginUnits::TChartMarginUnits(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartMarginUnits::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0)
  {
    Chart1->MarginUnits = muPercent;
    Label3->Caption = "%";
  }
  else
  {
    Chart1->MarginUnits = muPixels;
    Label3->Caption = "pixels";
  }
}
//---------------------------------------------------------------------------

void __fastcall TChartMarginUnits::FormCreate(TObject *Sender)
{
  ComboBox1->ItemIndex = 1;
  ComboBox1Change(this);
}
//---------------------------------------------------------------------------

void __fastcall TChartMarginUnits::Edit1Change(TObject *Sender)
{
  Chart1->MarginLeft = UpDown1->Position;
  Chart1->MarginTop = UpDown1->Position;
  Chart1->MarginRight = UpDown1->Position;
  Chart1->MarginBottom = UpDown1->Position;
}
//---------------------------------------------------------------------------

