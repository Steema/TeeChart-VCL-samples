//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_FreeAllSeries.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFreeAllSeriesForm *FreeAllSeriesForm;
//---------------------------------------------------------------------------
__fastcall TFreeAllSeriesForm::TFreeAllSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFreeAllSeriesForm::Button1Click(TObject *Sender)
{
  Chart1->FreeAllSeries(__classid(TLineSeries)); // removes LINE only
  Button1->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TFreeAllSeriesForm::Button2Click(TObject *Sender)
{
  Chart1->FreeAllSeries(__classid(TBarSeries)); // removes BAR only
  Button2->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TFreeAllSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(21);
  Series3->FillSampleValues(6);
  Series4->FillSampleValues(16);
  Series5->FillSampleValues(6);
}
//---------------------------------------------------------------------------

