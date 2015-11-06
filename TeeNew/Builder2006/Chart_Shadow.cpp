//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Shadow.h"
#include "TeeShadowEditor.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartShadow *ChartShadow;
//---------------------------------------------------------------------------
__fastcall TChartShadow::TChartShadow(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartShadow::FormCreate(TObject *Sender)
{
  Chart1->Shadow->HorizSize = 6;
  Chart1->Shadow->VertSize = 6;
  Chart1->Shadow->Color = clDkGray;
}
//---------------------------------------------------------------------------

void __fastcall TChartShadow::Button1Click(TObject *Sender)
{
  EditTeeShadow(this, Chart1->Shadow);
}
//---------------------------------------------------------------------------

void __fastcall TChartShadow::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) Chart1->Shadow->Size = 6;
  else Chart1->Shadow->Size = 0;

}
//---------------------------------------------------------------------------

