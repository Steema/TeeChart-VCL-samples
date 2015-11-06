//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_StackGroup.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBarStackGroup *BarStackGroup;
//---------------------------------------------------------------------------
__fastcall TBarStackGroup::TBarStackGroup(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarStackGroup::Edit1Change(TObject *Sender)
{
  for (int t=0; t<UpDown1->Position; t++)
   dynamic_cast<TBarSeries*>(Chart1->Series[t])->StackGroup = 0 ;

  for (int t=UpDown1->Position; t<Chart1->SeriesCount(); t++)
   dynamic_cast<TBarSeries*>(Chart1->Series[t])->StackGroup = 1 ;
}
//---------------------------------------------------------------------------

void __fastcall TBarStackGroup::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
  Series4->FillSampleValues(6);
  Series5->FillSampleValues(6);
}
//---------------------------------------------------------------------------

