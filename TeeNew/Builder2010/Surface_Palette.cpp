//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Surface_Palette.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TSurfacePaletteForm *SurfacePaletteForm;
//---------------------------------------------------------------------------
__fastcall TSurfacePaletteForm::TSurfacePaletteForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfacePaletteForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->PaletteStyle = psPale; break;
    case 1: Series1->PaletteStyle = psStrong; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSurfacePaletteForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(30);
}
//---------------------------------------------------------------------------

void __fastcall TSurfacePaletteForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 1;
}
//---------------------------------------------------------------------------

