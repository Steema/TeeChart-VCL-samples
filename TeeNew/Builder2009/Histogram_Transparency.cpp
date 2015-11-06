//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Histogram_Transparency.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
THistogramTransp *HistogramTransp;
//---------------------------------------------------------------------------
__fastcall THistogramTransp::THistogramTransp(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THistogramTransp::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(25);
  Series2->FillSampleValues(25);

  UpDown1->Position=Series2->Transparency;
}
//---------------------------------------------------------------------------

void __fastcall THistogramTransp::Edit1Change(TObject *Sender)
{
  Series2->Transparency=UpDown1->Position;
}
//---------------------------------------------------------------------------

