//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_3DDepth.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TBar3DDepth *Bar3DDepth;
//---------------------------------------------------------------------------
__fastcall TBar3DDepth::TBar3DDepth(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBar3DDepth::FormCreate(TObject *Sender)
{

  Chart1->SeriesList->FillSampleValues();

  for (int t=0 ; t<Chart1->SeriesCount(); t++)
  {
    TBarSeries *barseries = dynamic_cast<TBarSeries*>(Chart1->Series[t]);
    barseries->DepthPercent = 40;
    barseries->BarWidthPercent = 40;
  }

  ScrollBar1->Position = Series1->DepthPercent;
  ScrollBar2->Position = Series1->BarWidthPercent;
}
//---------------------------------------------------------------------------

void __fastcall TBar3DDepth::ScrollBar1Change(TObject *Sender)
{
  Series1->DepthPercent = ScrollBar1->Position;
  Series2->DepthPercent = ScrollBar1->Position;
  Series3->DepthPercent = ScrollBar1->Position;
  Series4->DepthPercent = ScrollBar1->Position;
  Series5->DepthPercent = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TBar3DDepth::ScrollBar2Change(TObject *Sender)
{
  Series1->BarWidthPercent = ScrollBar2->Position;
  Series2->BarWidthPercent = ScrollBar2->Position;
  Series3->BarWidthPercent = ScrollBar2->Position;
  Series4->BarWidthPercent = ScrollBar2->Position;
  Series5->BarWidthPercent = ScrollBar2->Position;
}
//---------------------------------------------------------------------------

