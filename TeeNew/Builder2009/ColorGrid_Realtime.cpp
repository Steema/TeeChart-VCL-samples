//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorGrid_Realtime.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"

class TListHack : public TChartValueList
{
  public:
	  void __fastcall RecalcStats(int StartIndex);
};

void __fastcall TListHack::RecalcStats(int StartIndex)
{
  TChartValueList::RecalcStats(StartIndex);
}

TColorGridRealtime *ColorGridRealtime;
//---------------------------------------------------------------------------
__fastcall TColorGridRealtime::TColorGridRealtime(TComponent* Owner)
  : TBaseForm(Owner)
{
  x = -1;

}
//---------------------------------------------------------------------------
void __fastcall TColorGridRealtime::UpdateTheChart()
{
  int index = ColorGrid->Count();
  int y;
  TColor rcolor;
  ColorGrid->BeginUpdate();
  try
  {
    x++;
    randomize();
    for (int z=0; z<DemoPoints; z++)
    {
      y = random(100);
      rcolor = (TColor)random(0xFFFFFF);
      ColorGrid->AddXYZ(x,y,z,"2",rcolor);
    }

    // BEGIN SPEED OPTIMIZATIONS
    static_cast<TListHack*>(ColorGrid->XValues)->RecalcStats(index);
    static_cast<TListHack*>(ColorGrid->YValues)->RecalcStats(index);
    static_cast<TListHack*>(ColorGrid->ZValues)->RecalcStats(index);

    if (ColorGrid->ReuseGridIndex) ColorGrid->FillGridIndex(index);
    // END SPEED OPTIMIZATIONS

    ColorGrid->Repaint();
  }
  __finally
  {
    ColorGrid->EndUpdate();
  }
}

void __fastcall TColorGridRealtime::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false;
  try
  {
    UpdateTheChart();
    Label1->Caption ="Size: "+IntToStr(ColorGrid->NumXValues)+" x "+IntToStr(ColorGrid->NumZValues);
  }
  __finally
  {
    Timer1->Enabled = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TColorGridRealtime::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    ColorGrid->Clear();
    ColorGrid->NumXValues = 0;
    ColorGrid->NumZValues = 0;
    x =-1;
  }

  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorGridRealtime::FormCreate(TObject *Sender)
{
  Timer1->Enabled = false;
  Timer1->Interval =1;

  // Remove chart parts to improve drawing speed
  Chart1->Legend->Hide();
  Chart1->ClipPoints = false;
  Chart1->Title->Hide();
  Chart1->Axes->Left->Grid->Hide();
  Chart1->Axes->Bottom->Grid->Hide();
  ColorGrid->Pen->Hide();

  // Speed tricks:
  ColorGrid->ReuseGridIndex = true;
  Chart1->Axes->FastCalc = true;
}
//---------------------------------------------------------------------------

void __fastcall TColorGridRealtime::CheckBox5Click(TObject *Sender)
{
  ColorGrid->SmoothBitmap = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorGridRealtime::CheckBox6Click(TObject *Sender)
{
  ColorGrid->ReuseGridIndex = CheckBox6->Checked;
}
//---------------------------------------------------------------------------

