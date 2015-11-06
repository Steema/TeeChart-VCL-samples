//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "TeeThemeEditor.hpp"
#pragma link "TeeThemeEditor"

#include "Chart_Themes.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartThemes *ChartThemes;
//---------------------------------------------------------------------------
__fastcall TChartThemes::TChartThemes(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartThemes::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
  Series1->ColorEachPoint = true;

  // Add all available themes to ListBox1.
  AddChartThemes(ListBox1->Items);

  // Select first theme (TeeChart default theme)
  ListBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TChartThemes::Button1Click(TObject *Sender)
{
  // Show the Chart Theme editor
  TChartThemeClass tmp = ChartThemeSelector(Chart1);
  if (tmp!=NULL)
  {
    // ListBox1->ItemIndex = ListBox1->Items->IndexOfObject(tmp);
  }

}
//---------------------------------------------------------------------------

void __fastcall TChartThemes::ListBox1Click(TObject *Sender)
{
  TMetaClass *tmp= (TMetaClass*)(ListBox1->Items->Objects[ListBox1->ItemIndex]);

  // Change Theme. The last parameter "-1" means to use the
  // default Theme color palette.
  ApplyChartTheme(tmp,Chart1,-1);
}
//---------------------------------------------------------------------------

