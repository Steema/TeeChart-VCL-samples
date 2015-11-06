//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Chart_Palettes.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TCustomPalettes *CustomPalettes;
//---------------------------------------------------------------------------
__fastcall TCustomPalettes::TCustomPalettes(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCustomPalettes::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(15);
  Series1->ColorEachPoint = true;  // <-- IMPORTANT, USE COLOR PALETTE

  ComboBox1->ItemIndex = 0;

  // Add pre-defined ColorPalettes to combobox:
  CBPalette->Clear();
  for (int  t=0; t< ColorPalettes->Count; t++) { CBPalette->Items->Add(ColorPalettes->Strings[t]);}

  // Create three custom color palettes (arrays of TColor)
  RedPalette = new TColor[15];
  for (int t=0; t<15; t++) {RedPalette[t] = TColor(RGB(128+floor(t*(128.0/15.0)),0,0));}

  BluePalette = new TColor[15];
  for (int t=0; t<15; t++) {BluePalette[t] = TColor(RGB(0,0,128+floor(t*(128.0/15.0))));}

  GreenPalette = new TColor[15];
  for (int t=0; t<15; t++) {GreenPalette[t] = TColor(RGB(0,128+floor(t*(128.0/15.0)),0));}

}
//---------------------------------------------------------------------------

void __fastcall TCustomPalettes::CBPaletteChange(TObject *Sender)
{
  // Set a pre-defined color palette
  //ColorPalettes->ApplyPalette(NULL, Chart1,CBPalette->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TCustomPalettes::ComboBox1Change(TObject *Sender)
{
  // Set a custom color palette
  switch (ComboBox1->ItemIndex)
  {
    case 1: SetDefaultColorPalette(RedPalette,15); break;
    case 2: SetDefaultColorPalette(BluePalette,15); break;
    case 3: SetDefaultColorPalette(GreenPalette,15); break;
    default : SetDefaultColorPalette(); break;
  }
  // Reset internal Chart color palette
  Chart1->ColorPalette.Length = 0;
  // Repaint chart
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

