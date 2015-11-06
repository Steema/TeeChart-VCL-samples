//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Gallery_Smooth.h"
#include "TeeThemeEditor.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeGalleryPanel"
#pragma resource "*.dfm"
TGallerySmooth *GallerySmooth;
//---------------------------------------------------------------------------
__fastcall TGallerySmooth::TGallerySmooth(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGallerySmooth::CheckBox2Click(TObject *Sender)
{
  ChartGalleryPanel1->View3D = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TGallerySmooth::CheckBox1Click(TObject *Sender)
{
  ChartGalleryPanel1->Smooth = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TGallerySmooth::FormCreate(TObject *Sender)
{
  ChartGalleryPanel1->CreateGalleryPage("Standard");
  ChartGalleryPanel1->NumCols = 3;
  ChartGalleryPanel1->NumRows = 2;
}
//---------------------------------------------------------------------------

void __fastcall TGallerySmooth::Button1Click(TObject *Sender)
{
  TChartThemeSelector *theme = new TChartThemeSelector(this);
  try
  {
    theme->Chart = ChartGalleryPanel1->SelectedChart;
    theme->CBScale->Checked = false;
    if (theme->ShowModal() == mrOk) ChartGalleryPanel1->UseTheme(theme->SelectedTheme());
  }
  __finally
  {
    delete theme;
  }
}
//---------------------------------------------------------------------------

