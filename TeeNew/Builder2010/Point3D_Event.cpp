//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Point3D_Event.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma link "TeePoin3"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TPoint3DEvent *Point3DEvent;
//---------------------------------------------------------------------------
__fastcall TPoint3DEvent::TPoint3DEvent(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
TSeriesPointerStyle __fastcall TPoint3DEvent::Series1GetPointerStyle(
      TChartSeries *Sender, int ValueIndex)
{
  TSeriesPointerStyle Res = psRectangle;
  if (CheckBox1->Checked)
  {
    int modulo = floor(fmod(ValueIndex,3));
    switch (modulo)
    {
      case 0: { Res = psCircle; Series1->Pointer->Brush->Color = clRed; } break;
      case 1: { Res = psTriangle; Series1->Pointer->Brush->Color = clBlue; } break;
      case 2: { Res = psRectangle; Series1->Pointer->Brush->Color = clYellow; } break;
    }
  }
  else
  {
    Res = psRectangle;
    Series1->Pointer->Brush->Color = clTeeColor;
  }

  return Res;
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DEvent::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DEvent::CheckBox1Click(TObject *Sender)
{
  Series1->Repaint();
}
//---------------------------------------------------------------------------

