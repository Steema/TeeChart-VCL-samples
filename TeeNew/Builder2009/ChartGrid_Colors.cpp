//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartGrid_Colors.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Chart_Grid"
#pragma link "TeeChartGrid"
#pragma link "TeeNavigator"
#pragma resource "*.dfm"
TChartGridColors *ChartGridColors;
//---------------------------------------------------------------------------
__fastcall TChartGridColors::TChartGridColors(TComponent* Owner)
        : TChartGridForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TChartGridColors::CheckBox3Click(TObject *Sender)
{
  ChartGrid1->ShowColors=CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartGridColors::CheckBox4Click(TObject *Sender)
{
  ChartGrid1->ShowFields=CheckBox4->Checked;
}
//---------------------------------------------------------------------------

