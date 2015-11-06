//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_CurrentPage.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeNavigator"
#pragma link "TeeEdiGene"
#pragma resource "*.dfm"
TLegendCurrentPage *LegendCurrentPage;
//---------------------------------------------------------------------------
__fastcall TLegendCurrentPage::TLegendCurrentPage(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendCurrentPage::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->CurrentPage = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLegendCurrentPage::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);

  Chart1->MaxPointsPerPage = 10;
}
//---------------------------------------------------------------------------

