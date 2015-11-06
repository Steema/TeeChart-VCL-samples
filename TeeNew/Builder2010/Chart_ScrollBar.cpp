//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_ScrollBar.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeScroB"
#pragma resource "*.dfm"
TChartScrollBarForm *ChartScrollBarForm;
//---------------------------------------------------------------------------
__fastcall TChartScrollBarForm::TChartScrollBarForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartScrollBarForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(1000);

  // show the first 100 points...
  Chart1->BottomAxis->SetMinMax(0,99);

  // adjust the ScrollBar
  ChartScrollBar1->RecalcPosition();
}
//---------------------------------------------------------------------------

void __fastcall TChartScrollBarForm::Button1Click(TObject *Sender)
{
  ChartScrollBar1->Position = ChartScrollBar1->Max;  // go to end
}
//---------------------------------------------------------------------------

void __fastcall TChartScrollBarForm::Button2Click(TObject *Sender)
{
  ChartScrollBar1->Position = ChartScrollBar1->Min;  // go to begin
}
//---------------------------------------------------------------------------

void __fastcall TChartScrollBarForm::ChartScrollBar1Change(TObject *Sender)
{
  // enable / disable the "go to begin" and "go to end" buttons...
  Button1->Enabled = ChartScrollBar1->Position < ChartScrollBar1->Max;
  Button2->Enabled = ChartScrollBar1->Position > ChartScrollBar1->Min;
}
//---------------------------------------------------------------------------

