//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Clock.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma link "TeeRose"
#pragma resource "*.dfm"
TClockSeriesForm *ClockSeriesForm;
//---------------------------------------------------------------------------
__fastcall TClockSeriesForm::TClockSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TClockSeriesForm::CheckBox1Click(TObject *Sender)
{
  TClockSeriesStyle tmp;
  if (CheckBox1->Checked) tmp = cssRoman;
  else tmp = cssDecimal;

  Series1->Style = tmp;
  Series2->Style = tmp;
  Series3->Style = tmp;
  Series4->Style = tmp;
  Series5->Style = tmp;
  Series6->Style = tmp;
}
//---------------------------------------------------------------------------

void __fastcall TClockSeriesForm::Series2GetTime(TClockSeries *Sender,
      TDateTime &ATime)
{
  ATime = ATime + (UpDown1->Position/24.0) ;
}
//---------------------------------------------------------------------------

