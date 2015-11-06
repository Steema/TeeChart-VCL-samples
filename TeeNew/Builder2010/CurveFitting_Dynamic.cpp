//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CurveFitting_Dynamic.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "CurvFitt"
#pragma link "TeeComma"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TDynamicTrend *DynamicTrend;
//---------------------------------------------------------------------------
__fastcall TDynamicTrend::TDynamicTrend(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDynamicTrend::ResizeFunction(TCustomFittingFunction *AFunction, int APos)
{
  if ((AFunction->FirstPoint+APos) < dynamic_cast<TChartSeries*>(AFunction->ParentSeries->DataSource)->Count())
  {
      AFunction->BeginUpdate();
      AFunction->LastPoint = AFunction->FirstPoint+APos;
      AFunction->FirstCalcPoint = AFunction->FirstPoint;
      AFunction->LastCalcPoint = AFunction->LastPoint;
      AFunction->EndUpdate();
      ScrollBar1->Max = Series1->Count()-APos;
  }
}
//---------------------------------------------------------------------------
void __fastcall TDynamicTrend::MoveFunction(TCustomFittingFunction *AFunction, int APos)
{
  int tmp = AFunction->LastPoint - AFunction->FirstPoint;
  if ((APos+tmp) < dynamic_cast<TChartSeries*>(AFunction->ParentSeries->DataSource)->Count())
  {
    AFunction->BeginUpdate();
    AFunction->FirstPoint = APos;
    AFunction->LastPoint = AFunction->FirstPoint+tmp;
    AFunction->FirstCalcPoint = AFunction->FirstPoint;
    AFunction->LastCalcPoint = AFunction->LastPoint;
    AFunction->EndUpdate();
  }
}
//---------------------------------------------------------------------------

void __fastcall TDynamicTrend::ScrollBar2Change(TObject *Sender)
{
  ResizeFunction(TeeFunction2,ScrollBar2->Position);
}
//---------------------------------------------------------------------------

void __fastcall TDynamicTrend::ScrollBar1Change(TObject *Sender)
{
  MoveFunction(TeeFunction2,ScrollBar1->Position);
}
//---------------------------------------------------------------------------

void __fastcall TDynamicTrend::Timer1Timer(TObject *Sender)
{
  if (ScrollBar1->Position < ScrollBar1->Max-1) ScrollBar1->Position += 1;
  else ScrollBar1->Position = ScrollBar1->Min;

  if (ScrollBar3->Position < ScrollBar3->Max-1) ScrollBar3->Position += 1;
  else ScrollBar3->Position = ScrollBar3->Min;

}
//---------------------------------------------------------------------------

void __fastcall TDynamicTrend::ScrollBar3Change(TObject *Sender)
{
  MoveFunction(TeeFunction1,ScrollBar3->Position);
}
//---------------------------------------------------------------------------


void __fastcall TDynamicTrend::ScrollBar4Change(TObject *Sender)
{
  ResizeFunction(TeeFunction1,ScrollBar4->Position);
}
//---------------------------------------------------------------------------

void __fastcall TDynamicTrend::FormCreate(TObject *Sender)
{
  // set function first and last points
  TeeFunction1->FirstPoint = 10;
  TeeFunction1->LastPoint = 40;
  TeeFunction1->FirstCalcPoint = 10;
  TeeFunction1->LastCalcPoint = 40;
  TeeFunction2->FirstPoint = 40;
  TeeFunction2->LastPoint = 70;
  TeeFunction2->FirstCalcPoint = 40;
  TeeFunction2->LastCalcPoint = 70;

  // add sample random values to red line
  Series1->FillSampleValues(280);
  ScrollBar1->Max = Series1->Count();
  ScrollBar3->Max = Series1->Count();

  // default size in number of points
  ScrollBar2->Position = 30;
  ScrollBar4->Position = 30;
}
//---------------------------------------------------------------------------

