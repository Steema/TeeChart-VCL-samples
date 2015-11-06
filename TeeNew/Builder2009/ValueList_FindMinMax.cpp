//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ValueList_FindMinMax.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TFindMinMaxValues *FindMinMaxValues;
//---------------------------------------------------------------------------
__fastcall TFindMinMaxValues::TFindMinMaxValues(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
// This procedure returns the min and max of a portion of
//  Series points (from "first" point to "last" point)
void __fastcall SeriesMinMax(TChartSeries *ASeries, int FirstPoint, int LastPoint,
                             double &AMin, double &AMax)
{
  AMin = ASeries->YValues->Value[FirstPoint];
  AMax = ASeries->YValues->Value[FirstPoint];
  for (int t=FirstPoint+1; t<LastPoint; t++)
  {
      if (ASeries->YValues->Value[t] < AMin) AMin = ASeries->YValues->Value[t];
      else if (ASeries->YValues->Value[t] > AMax) AMax = ASeries->YValues->Value[t];
  }
}

//---------------------------------------------------------------------------
void __fastcall TFindMinMaxValues::Button1Click(TObject *Sender)
{
  double AMin, AMax;
  // Show the Series points between 20 and 50 only
  Chart1->BottomAxis->SetMinMax(20,50);

  // Now find the min and max for this portion of points
  SeriesMinMax( Series1, 20, 50, AMin, AMax);

  // For example, set the vertical axis to fit
  Chart1->LeftAxis->SetMinMax(AMin,AMax);

  Button2->Enabled = true;
  Button1->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TFindMinMaxValues::FormCreate(TObject *Sender)
{
  double AMin, AMax;

  Series1->FillSampleValues(100);
  // move the green lines to the correct positions
  SeriesMinMax(Series1, 20, 50, AMin, AMax);
  ChartTool3->Value = AMin;
  ChartTool4->Value = AMax;
}
//---------------------------------------------------------------------------

void __fastcall TFindMinMaxValues::Button2Click(TObject *Sender)
{
  Chart1->LeftAxis->Automatic = true;
  Chart1->BottomAxis->Automatic = true;
  Button1->Enabled = true;
  Button2->Enabled = false;
}
//---------------------------------------------------------------------------

