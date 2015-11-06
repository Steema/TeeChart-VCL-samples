//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series3D_RangePalette.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TSeries3DRangePalette *Series3DRangePalette;
//---------------------------------------------------------------------------
__fastcall TSeries3DRangePalette::TSeries3DRangePalette(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeries3DRangePalette::CheckBox1Click(TObject *Sender)
{
  // enable the edit box...
  Edit1->Enabled = !CheckBox1->Checked;
  UpDown1->Enabled = !CheckBox1->Checked;

  // do we use "Steps" ??
  if (CheckBox1->Checked)  // no
  {
    Series1->UsePalette = false;
    Series1->UseColorRange = true;
    Series1->CreateDefaultPalette(Series1->PaletteSteps);
  }
  else  // yes
  {
    Series1->UsePalette = true;
    Series1->UseColorRange = false;
    Series1->CreateRangePalette();    // <-- new, use range of colors
  }
}
//---------------------------------------------------------------------------

void __fastcall TSeries3DRangePalette::Edit1Change(TObject *Sender)
{
  if (Showing)  // re-create the color palette using range }
  {
    Series1->PaletteSteps = UpDown1->Position;
    Series1->CreateRangePalette();
    Series1->Repaint();
  }

}
//---------------------------------------------------------------------------

void __fastcall TSeries3DRangePalette::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
  Series1->PaletteSteps = 10;

  // set-up initial values for controls
  ButtonColor1->LinkProperty(Series1,"StartColor");
  ButtonColor2->LinkProperty(Series1,"EndColor");
  ButtonColor3->LinkProperty(Series1,"MidColor");
  UpDown1->Position = Series1->PaletteSteps;

  // create the palette
  CheckBox1Click(this);
}
//---------------------------------------------------------------------------

void __fastcall TSeries3DRangePalette::ButtonColor1Click(TObject *Sender)
{
  if (!CheckBox1->Checked) Series1->CreateRangePalette();
}
//---------------------------------------------------------------------------

