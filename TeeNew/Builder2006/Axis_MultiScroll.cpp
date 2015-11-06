//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_MultiScroll.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "math"
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TMultiAxisScroll *MultiAxisScroll;
//---------------------------------------------------------------------------
__fastcall TMultiAxisScroll::TMultiAxisScroll(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMultiAxisScroll::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
  Series2->FillSampleValues(100);
  Series3->FillSampleValues(100);
  Series4->FillSampleValues(100);

  // change the Left axis properties
  Chart1->LeftAxis->Axis->Color = clRed;
  Chart1->LeftAxis->StartPosition = 0;
  Chart1->LeftAxis->EndPosition = 33;
  // create custom axes. This can be done at design-time with the chart editor
  Green = new TChartAxis(Chart1->CustomAxes);
  Green->Axis->Color = clGreen;
  Green->StartPosition = 33;
  Green->EndPosition = 66;

  Blue = new TChartAxis(Chart1->CustomAxes);
  Blue->Axis->Color = clBlue;
  Blue->StartPosition = 66;
  Blue->EndPosition = 100;
  // associate series
  Series1->VertAxis = aLeftAxis;
  Series2->VertAxis = aLeftAxis;
  Series3->CustomVertAxis = Green;
  Series4->CustomVertAxis = Blue;
}
//---------------------------------------------------------------------------

// limit scroll
void __fastcall TMultiAxisScroll::Chart1Scroll(TObject *Sender)
{
  double tmpMin, tmpMax;

  if (!CheckBoxRed->Checked)
  {
    tmpMin = Min(Series1->YValues->MinValue,Series2->YValues->MinValue);
    tmpMax = Max(Series1->YValues->MaxValue,Series2->YValues->MaxValue);
    Chart1->LeftAxis->SetMinMax(tmpMin,tmpMax);
  }

  if (!CheckBoxGreen->Checked) Green->SetMinMax(Series3->YValues->MinValue,Series3->YValues->MaxValue);

  if (!CheckBoxBlue->Checked) Blue->SetMinMax(Series4->YValues->MinValue,Series4->YValues->MaxValue);
}
//---------------------------------------------------------------------------

