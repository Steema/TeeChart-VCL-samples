//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Surface_Sides.h"
#include <TeeBrushDlg.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TSurfaceSidesDemo *SurfaceSides;
//---------------------------------------------------------------------------
__fastcall TSurfaceSidesDemo::TSurfaceSidesDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceSidesDemo::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    Series1->SideBrush->Style = bsDiagCross;
    Series1->SideBrush->Color = clBlue;
  }
  else Series1->SideBrush->Style = bsClear;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSidesDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(12);
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSidesDemo::Button1Click(TObject *Sender)
{
  EditChartBrush(this,Series1->SideBrush);
}
//---------------------------------------------------------------------------

