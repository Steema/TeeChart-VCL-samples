//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Surface_Transparency.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSurfaceTransp *SurfaceTransp;
//---------------------------------------------------------------------------
__fastcall TSurfaceTransp::TSurfaceTransp(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceTransp::ScrollBar1Change(TObject *Sender)
{
  Series1->Transparency = ScrollBar1->Position;
  Label2->Caption = IntToStr(ScrollBar1->Position)+" %";
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceTransp::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series1->Transparency = 50;
}
//---------------------------------------------------------------------------

