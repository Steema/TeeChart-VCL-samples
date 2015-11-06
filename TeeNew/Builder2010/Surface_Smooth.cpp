//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Surface_Smooth.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TSurfaceSmooth *SurfaceSmooth;
//---------------------------------------------------------------------------
__fastcall TSurfaceSmooth::TSurfaceSmooth(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceSmooth::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSmooth::CheckBox1Click(TObject *Sender)
{
  Series1->SmoothPalette = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

