//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_PageNavigator.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeNavigator"
#pragma link "TeeEdiGene"
#pragma resource "*.dfm"
TPageNavigatorForm *PageNavigatorForm;
//---------------------------------------------------------------------------
__fastcall TPageNavigatorForm::TPageNavigatorForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPageNavigatorForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(1000);
  Chart1->MaxPointsPerPage = 50;     // number of pages: 1000 / 50 = 20
}
//---------------------------------------------------------------------------

void __fastcall TPageNavigatorForm::Chart1PageChange(TObject *Sender)
{
  Label2->Caption = IntToStr(Chart1->Page)+" of "+IntToStr(Chart1->NumPages());
}
//---------------------------------------------------------------------------

