//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_OpaqueZone.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TAxisOpaqueZone *AxisOpaqueZone;
//---------------------------------------------------------------------------
__fastcall TAxisOpaqueZone::TAxisOpaqueZone(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
  TRect __fastcall SeriesRect(TChartSeries *Series)
  {
    TRect tmp;
    tmp.Left = Series->GetHorizAxis->IStartPos;
    tmp.Right = Series->GetHorizAxis->IEndPos;
    tmp.Top = Series->GetVertAxis->IStartPos;
    tmp.Bottom = Series->GetVertAxis->IEndPos;
    return tmp;
  }

void __fastcall TAxisOpaqueZone::SeriesBeforeDraw(TObject *Sender)
{
  // make opaque
  if (CheckBox1->Checked)
    if (Chart1->CanClip())
    {
      Chart1->Canvas->ClipRectangle(SeriesRect(dynamic_cast<TChartSeries*>(Sender)));
    }
}
//---------------------------------------------------------------------------
void __fastcall TAxisOpaqueZone::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
  Series2->FillSampleValues(100);
  Series3->FillSampleValues(100);
  Series4->FillSampleValues(100);

  // set series events (can also be done with the Object Inspector) }
  Series1->BeforeDrawValues = SeriesBeforeDraw;
  Series2->BeforeDrawValues = SeriesBeforeDraw;
  Series3->BeforeDrawValues = SeriesBeforeDraw;
  Series4->BeforeDrawValues = SeriesBeforeDraw;

  Series1->AfterDrawValues = SeriesAfterDraw;
  Series2->AfterDrawValues = SeriesAfterDraw;
  Series3->AfterDrawValues = SeriesAfterDraw;
  Series4->AfterDrawValues = SeriesAfterDraw;
}
//---------------------------------------------------------------------------


void __fastcall TAxisOpaqueZone::SeriesAfterDraw(TObject *Sender)
{
  if (CheckBox1->Checked) Chart1->Canvas->UnClipRectangle();
}
//---------------------------------------------------------------------------

void __fastcall TAxisOpaqueZone::Chart1Scroll(TObject *Sender)
{
  ChartTool1->Value = ChartTool1->Axis->Minimum;
  ChartTool2->Value = ChartTool2->Axis->Minimum;
  ChartTool3->Value = ChartTool3->Axis->Minimum;

}
//---------------------------------------------------------------------------

void __fastcall TAxisOpaqueZone::CheckBox1Click(TObject *Sender)
{
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TAxisOpaqueZone::DoScroll(TChartSeries *Series)
{
    TChartValueList *VL = Series->YValues;
    double tmp = (ScrollBar1->Position -50)*(VL->MaxValue - VL->MinValue)/100;
    Series->GetVertAxis->SetMinMax(VL->MaxValue+tmp,VL->MinValue+tmp);
}

void __fastcall TAxisOpaqueZone::ScrollBar1Change(TObject *Sender)
{
  DoScroll(Series1);
  DoScroll(Series2);
  DoScroll(Series3);
  DoScroll(Series4);
  Chart1Scroll(this);
}
//---------------------------------------------------------------------------

