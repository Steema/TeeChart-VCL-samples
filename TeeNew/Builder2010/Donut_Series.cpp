//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Donut_Series.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeDonut"
#pragma resource "*.dfm"
TDonutSeriesForm *DonutSeriesForm;
//---------------------------------------------------------------------------
__fastcall TDonutSeriesForm::TDonutSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDonutSeriesForm::EDonutChange(TObject *Sender)
{
  if (this->Showing) Series1->DonutPercent = UDDonut->Position;
}
//---------------------------------------------------------------------------

void __fastcall TDonutSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

