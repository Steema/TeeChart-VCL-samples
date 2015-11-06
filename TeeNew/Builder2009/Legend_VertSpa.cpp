//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_VertSpa.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "Bar3D"
#pragma resource "*.dfm"
TLegendVertSpa *LegendVertSpa;
//---------------------------------------------------------------------------
__fastcall TLegendVertSpa::TLegendVertSpa(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendVertSpa::Edit1Change(TObject *Sender)
{
  Chart1->Legend->VertSpacing = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TLegendVertSpa::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
}
//---------------------------------------------------------------------------

