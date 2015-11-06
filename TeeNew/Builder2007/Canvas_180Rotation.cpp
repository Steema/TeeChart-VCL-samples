//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_180Rotation.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
// TChartAccess class impelmentation
//---------------------------------------------------------------------------
TCanvas180Rotation *Canvas180Rotation;
//---------------------------------------------------------------------------
__fastcall TCanvas180Rotation::TCanvas180Rotation(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCanvas180Rotation::ScrollBar1Change(TObject *Sender)
{
  Chart1->View3DOptions->Rotation = ScrollBar1->Position;
  Label2->Caption = IntToStr(Chart1->View3DOptions->Rotation);
}
//---------------------------------------------------------------------------

void __fastcall TCanvas180Rotation::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(4);
  Chart1->Walls->Right->AutoHide = true;
  Chart1->Walls->Left->AutoHide = true;
}
//---------------------------------------------------------------------------

void __fastcall TCanvas180Rotation::CheckBox1Click(TObject *Sender)
{
  Chart1->Walls->Right->AutoHide = CheckBox1->Checked;
  Chart1->Walls->Left->AutoHide = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

