//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Actions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeChartActions"
#pragma resource "*.dfm"
TChartActionsForm *ChartActionsForm;
//---------------------------------------------------------------------------
__fastcall TChartActionsForm::TChartActionsForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartActionsForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

