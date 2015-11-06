//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pie_SliceHeights.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeDonut"
#pragma resource "*.dfm"
TPieSliceHeights *PieSliceHeights;
//---------------------------------------------------------------------------
__fastcall TPieSliceHeights::TPieSliceHeights(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieSliceHeights::CheckBox1Click(TObject *Sender)
{
  for (int t=0; t<Series1->Count(); t++)
  {
    if (CheckBox1->Checked)
      Series1->SliceHeight->Value[t] = (int)(t*100/(double)Series1->Count());
    else Series1->SliceHeight->Value[t] = 100;  // total height for all slices
  }
}
//---------------------------------------------------------------------------

void __fastcall TPieSliceHeights::FormCreate(TObject *Sender)
{
  // change viewer orientation
  Series1->RotationAngle = 135;
  Chart1->View3DOptions->Elevation = 320;

  Series1->FillSampleValues();
  CheckBox1Click(this);

  ScrollBar1->Position = Series1->RotationAngle;
  ScrollBar2->Position = Chart1->View3DOptions->Elevation;
}
//---------------------------------------------------------------------------

void __fastcall TPieSliceHeights::ScrollBar1Change(TObject *Sender)
{
  // Change pie rotation
  Series1->RotationAngle = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TPieSliceHeights::ScrollBar2Change(TObject *Sender)
{
  // Change pie elevation
  Chart1->View3DOptions->Elevation = ScrollBar2->Position;
}
//---------------------------------------------------------------------------

