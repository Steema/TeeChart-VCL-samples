//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "PolarRadar_Transparency.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TPolarRadarTransp *PolarRadarTransp;
//---------------------------------------------------------------------------
__fastcall TPolarRadarTransp::TPolarRadarTransp(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPolarRadarTransp::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(10);
  Series3->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TPolarRadarTransp::Edit1Change(TObject *Sender)
{
  Series1->Transparency=UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TPolarRadarTransp::Edit2Change(TObject *Sender)
{
  Series2->Transparency=UpDown2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TPolarRadarTransp::Edit3Change(TObject *Sender)
{
  Series3->Transparency=UpDown3->Position;
}
//---------------------------------------------------------------------------

