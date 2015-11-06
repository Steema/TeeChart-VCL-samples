//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "ValueList_Modified.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TValueListModified *ValueListModified;
//---------------------------------------------------------------------------
__fastcall TValueListModified::TValueListModified(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TValueListModified::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(1000);
}
//---------------------------------------------------------------------------

void __fastcall TValueListModified::Button1Click(TObject *Sender)
{
  // Modify series values DIRECTLY accessing the dynamic array:
  Series1->YValues->Value[0] = random(10000);
  for (int t=1; t< Series1->Count(); t++)
    Series1->YValues->Value[t] = Series1->YValues->Value[t-1]+random(1000)-500;

  // setting "modified" to True forces the Axes to recalculate min and max
  Series1->YValues->Modified = true;

  // tell the Series to repaint
  Series1->Repaint();
}
//---------------------------------------------------------------------------

