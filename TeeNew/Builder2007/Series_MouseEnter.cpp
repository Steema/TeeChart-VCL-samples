//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_MouseEnter.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TSeriesMouseEnter *SeriesMouseEnter;
//---------------------------------------------------------------------------
__fastcall TSeriesMouseEnter::TSeriesMouseEnter(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeriesMouseEnter::Series1MouseEnter(TObject *Sender)
{
  TChartSeries *tmp = dynamic_cast<TChartSeries*>(Sender); // Sender is the Series

  // Obtain point index under mouse cursor
  int clicked = tmp->GetCursorValueIndex();

  // Show Series name and point index and value
  Label1->Caption = "Series: " + tmp->Name+
                  " point: " + IntToStr(clicked)+
                  " value: " + tmp->YValues->ToString(clicked);
}
//---------------------------------------------------------------------------

void __fastcall TSeriesMouseEnter::Series1MouseLeave(TObject *Sender)
{
  Label1->Caption = "";  
}
//---------------------------------------------------------------------------

void __fastcall TSeriesMouseEnter::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(10);
}
//---------------------------------------------------------------------------

