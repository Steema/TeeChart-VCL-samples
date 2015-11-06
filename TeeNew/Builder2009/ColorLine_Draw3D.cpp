//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorLine_Draw3D.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TColorLine3D *ColorLine3D;
//---------------------------------------------------------------------------
__fastcall TColorLine3D::TColorLine3D(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorLine3D::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Draw3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorLine3D::CheckBox2Click(TObject *Sender)
{
  ChartTool1->DrawBehind = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorLine3D::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);

  // find center

  double tmp = 0.5*(Series1->YValues->MaxValue +Series1->YValues->MinValue);
  ChartTool1->Value = tmp;
}
//---------------------------------------------------------------------------

