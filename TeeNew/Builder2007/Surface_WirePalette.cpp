//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Surface_WirePalette.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TSurfaceWire *SurfaceWire;
//---------------------------------------------------------------------------
__fastcall TSurfaceWire::TSurfaceWire(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceWire::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);

  Series1->UsePalette = true;
  Series1->Pen->Width = 2;
  Series1->WireFrame = true;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceWire::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: { Series1->UseColorRange = false; Series1->UsePalette = false;} break;
    case 1: { Series1->UseColorRange = true; Series1->UsePalette = false;} break;
    case 2: { Series1->UseColorRange = false; Series1->UsePalette = true;} break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceWire::CheckBox1Click(TObject *Sender)
{
  Series1->WireFrame = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceWire::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 2;
}
//---------------------------------------------------------------------------

