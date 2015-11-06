//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pie_Multi.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPieMultiple *PieMultiple;
//---------------------------------------------------------------------------
__fastcall TPieMultiple::TPieMultiple(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieMultiple::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(4);
  Series2->FillSampleValues(4);
  Series3->FillSampleValues(4);
  Series4->FillSampleValues(4);

  Chart1->ApplyZOrder = false;
}
//---------------------------------------------------------------------------

void __fastcall TPieMultiple::Series1BeforeDrawValues(TObject *Sender)
{
  Chart1->ChartRect = Rect(10,10,Chart1->Width/2, Chart1->Height/2);
}
//---------------------------------------------------------------------------

void __fastcall TPieMultiple::Series2BeforeDrawValues(TObject *Sender)
{
  Chart1->ChartRect = Rect(Chart1->Width/2, 10, Chart1->Width, Chart1->Height/2);
}
//---------------------------------------------------------------------------

void __fastcall TPieMultiple::Series3BeforeDrawValues(TObject *Sender)
{
  Chart1->ChartRect = Rect(10,Chart1->Height/2,Chart1->Width/2, Chart1->Height);
}
//---------------------------------------------------------------------------

void __fastcall TPieMultiple::Series4BeforeDrawValues(TObject *Sender)
{
  Chart1->ChartRect = Rect(Chart1->Width/2, Chart1->Height/2, Chart1->Width, Chart1->Height);
}
//---------------------------------------------------------------------------

