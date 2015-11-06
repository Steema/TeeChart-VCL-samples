//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartGrid_Grid3D.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeChartGrid"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TChartGrid3D *ChartGrid3D;
//---------------------------------------------------------------------------
__fastcall TChartGrid3D::TChartGrid3D(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartGrid3D::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
  ChartGrid1->Grid3DMode = true;

  // cosmetic
  ChartGrid1->DefaultColWidth = 38;
}
//---------------------------------------------------------------------------

void __fastcall TChartGrid3D::CheckBox1Click(TObject *Sender)
{
  ChartGrid1->Grid3DMode = !ChartGrid1->Grid3DMode;
}
//---------------------------------------------------------------------------

