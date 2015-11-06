//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorGrid_Transparent.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TColorGridTransparent *ColorGridTransparent;
//---------------------------------------------------------------------------
__fastcall TColorGridTransparent::TColorGridTransparent(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorGridTransparent::FormCreate(TObject *Sender)
{
  UpDown1->Max = 30;

  Series1->FillSampleValues(100);
  Series1->UseColorRange = false;
  Series1->UsePalette = true;
  Series1->PaletteSteps = UpDown1->Max;
  Series1->CreateRangePalette();

  // choose a color (white for example) to be transparent
  Series1->Bitmap->TransparentColor = clWhite;
  Series1->Bitmap->TransparentMode = tmFixed;
  Series1->Bitmap->Transparent = true;
}
//---------------------------------------------------------------------------
void __fastcall TColorGridTransparent::SetTransparentColors()
{
  // force bitmap to change
  Series1->Bitmap->Transparent = false;
  Series1->Bitmap->Transparent = true;

  // re-create the palette
  Series1->CreateRangePalette();

  // set levels to transparent color (white in this example)  }
  for (int t=0; t<UpDown1->Position; t++) Series1->Palette[t].Color = clWhite;

}
//---------------------------------------------------------------------------

void __fastcall TColorGridTransparent::CheckBox1Click(TObject *Sender)
{
  Edit1->Enabled = CheckBox1->Checked;
  UpDown1->Enabled = CheckBox1->Checked;

  Series1->Bitmap->Transparent = CheckBox1->Checked;
  Series1->CreateRangePalette();
  if (CheckBox1->Checked) SetTransparentColors();

  Series1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TColorGridTransparent::Edit1Change(TObject *Sender)
{
  SetTransparentColors();
  Series1->Repaint();
}
//---------------------------------------------------------------------------

