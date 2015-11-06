//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Exponential_Trend.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CurvFitt"
#pragma resource "*.dfm"
TExponentialTrendForm *ExponentialTrendForm;
//---------------------------------------------------------------------------
__fastcall TExponentialTrendForm::TExponentialTrendForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExponentialTrendForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(1000);
}
//---------------------------------------------------------------------------

