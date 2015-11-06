//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Multi.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMultiLegendForm *MultiLegendForm;
//---------------------------------------------------------------------------
__fastcall TMultiLegendForm::TMultiLegendForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMultiLegendForm::Chart1AfterDraw(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    TChartLegend *Legend = Chart1->Legend;
    Legend->Top = 125;
    Legend->Series = Series2;
    Legend->DrawLegend();
    Legend->CustomPosition = false;
    Legend->Series = Series1;
  }
}
//---------------------------------------------------------------------------

void __fastcall TMultiLegendForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(4);
  Series2->FillSampleValues(4);

  Chart1->Legend->LegendStyle = lsValues;
  Chart1->Legend->Series = Series1;

}
//---------------------------------------------------------------------------

void __fastcall TMultiLegendForm::CheckBox1Click(TObject *Sender)
{
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

