//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Contour_Palette.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TContourPaletteForm *ContourPaletteForm;
//---------------------------------------------------------------------------
__fastcall TContourPaletteForm::TContourPaletteForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TContourPaletteForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(25);
}
//---------------------------------------------------------------------------

void __fastcall TContourPaletteForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: // single color
         {
           Series1->UseColorRange =false;
           Series1->UsePalette =false;
           Series1->SeriesColor =clYellow;
         } break;
    case 1: // gradient 2 colors
         {
           Series1->UseColorRange = true;
           Series1->UsePalette = false;
           Series1->StartColor = clBlue;
           Series1->EndColor = clRed;
           Series1->MidColor = clNone;
         } break;
    case 2: // gradient 3 colors
         {
           Series1->UseColorRange = true;
           Series1->UsePalette = false;
           Series1->StartColor = clBlue;
           Series1->EndColor = clRed;
           Series1->MidColor = clYellow;
         } break;
    case 3: // palette "pale"
         {
           Series1->UseColorRange = false;
           Series1->UsePalette = true;
           Series1->PaletteStyle = psPale;
         } break;
    case 4: // palette "strong"
         {
           Series1->UseColorRange = false;
           Series1->UsePalette = true;
           Series1->PaletteStyle = psStrong;
         } break;
    }
}
//---------------------------------------------------------------------------

void __fastcall TContourPaletteForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 2;
  ComboBox1Change(this);
}
//---------------------------------------------------------------------------

