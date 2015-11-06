//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#include <math.h>
#pragma hdrstop

#include "QualityControl.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeTools"
#pragma resource "*.dfm"
TFormQuality *FormQuality;
//---------------------------------------------------------------------------
__fastcall TFormQuality::TFormQuality(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormQuality::CalculateSPC(TChartSeries *Good, TChartSeries *Bad)
{
  double Percent;
  double NumTotal;

  UL = 0.0;
  LL  = 0.0;
  double Sum = 0.0;
  double SumN = 0.0;
  int N = 0;
  for (int t=0;t < Good->Count(); t++)
  {
    Percent = (Bad->YValues->Value[t]*Good->YValues->Value[t]/100.0);
    NumTotal = Good->YValues->Value[t]+Percent;
    if (NumTotal>0)
    {
      Sum = Sum+Percent/NumTotal;
      SumN = SumN + NumTotal;
      N++;
    }
  }
  double LCP = Sum/double(N);
  double LCN = SumN/double(N);
  double tmp = (LCP*(1-LCP))/LCN;
  if (tmp>0)
  {
    double Aux = 3*sqrt(tmp); // <-- 3 by square root
    UL = 100.0*(LCP+Aux);
    LL = 100.0*(LCP-Aux);
  }
}

void __fastcall TFormQuality::FormCreate(TObject *Sender)
{
  Good->Clear();
  for (int t=0; t<20; t++) Good->Add(800+random(200),"",clTeeColor);

  Bad->Clear();
  for (int t=0; t<20; t++) Bad->Add(4+random(4),"",clTeeColor);

  CalculateSPC(Good,Bad);

  UpperEdit->Text = FormatFloat("#.0000",UL);
  LowerEdit->Text = FormatFloat("#.0000",LL);

  Chart1->LeftAxis->SetMinMax(0,1100);
  Chart1->RightAxis->SetMinMax(0,10);
}
//---------------------------------------------------------------------------

void __fastcall TFormQuality::UpperEditChange(TObject *Sender)
{
  // set upper limit
  double tmp = StrToFloat(UpperEdit->Text);
  ChartTool1->Value = tmp;
}
//---------------------------------------------------------------------------

void __fastcall TFormQuality::LowerEditChange(TObject *Sender)
{
  // set lower limit
  double tmp = StrToFloat(LowerEdit->Text);
  ChartTool2->Value = tmp;
}
//---------------------------------------------------------------------------

