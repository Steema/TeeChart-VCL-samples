//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axes_DrawBevels.h"
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBeveledAxes *BeveledAxes;
//---------------------------------------------------------------------------
__fastcall TBeveledAxes::TBeveledAxes(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
// This routine draws a bevel around TeeChart axes
void __fastcall DrawBevelAroundAxes(TCustomChart *Chart, TBevelCut Style, int Size)
{
  TRect R = Chart->ChartRect;
  R.Right += 1;
  R.Bottom += 1;
  DrawBevel(Chart->Canvas,Style,R,Size);
}
//---------------------------------------------------------------------------
void __fastcall TBeveledAxes::AdjustAxisOffsets()
{
  int tmpSize;
  CheckBox1->Checked ? tmpSize=UpDown1->Position : tmpSize = 0;
  for (int t=0; t<Chart1->Axes->Count; t++)
  {
    Chart1->Axes->Items[t]->MinimumOffset = tmpSize;
    Chart1->Axes->Items[t]->MaximumOffset = tmpSize;
  }

  Chart1->Invalidate();
}
//---------------------------------------------------------------------------
void __fastcall TBeveledAxes::Chart1AfterDraw(TObject *Sender)
{
  if (CheckBox1->Checked)
    switch (ComboFlat1->ItemIndex)
    {
      case 0 : DrawBevelAroundAxes(Chart1, bvLowered, UpDown1->Position); break;
      case 1 : DrawBevelAroundAxes(Chart1, bvRaised, UpDown1->Position); break;
    }
}
//---------------------------------------------------------------------------

void __fastcall TBeveledAxes::FormCreate(TObject *Sender)
{
  ComboFlat1->ItemIndex = 0;
  Series1->FillSampleValues();

  // Bevels look fine on 2D only.
  Chart1->View3D = false;

  Chart1->Axes->Left->Axis->Width = 1;
  Chart1->Axes->Left->MinorTicks->Color = clBlack;
  Chart1->Axes->Left->MinorTickLength = 3;
  Chart1->Axes->Left->Ticks->Color = clBlack;
  //ColorPalettes->ApplyPalette(Chart1,WindowsXPPalette);
}
//---------------------------------------------------------------------------

void __fastcall TBeveledAxes::CheckBox1Click(TObject *Sender)
{
  Label1->Enabled = CheckBox1->Checked;
  Edit1->Enabled = CheckBox1->Checked;
  UpDown1->Enabled = CheckBox1->Checked;
  ComboFlat1->Enabled = CheckBox1->Checked;

  AdjustAxisOffsets();
}
//---------------------------------------------------------------------------

void __fastcall TBeveledAxes::Edit1Change(TObject *Sender)
{
  AdjustAxisOffsets();
}
//---------------------------------------------------------------------------

void __fastcall TBeveledAxes::ComboFlat1Change(TObject *Sender)
{
  AdjustAxisOffsets();
}
//---------------------------------------------------------------------------

