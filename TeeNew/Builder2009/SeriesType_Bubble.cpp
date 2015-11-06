//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "SeriesType_Bubble.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TBubbleSeriesForm *BubbleSeriesForm;
//---------------------------------------------------------------------------
__fastcall TBubbleSeriesForm::TBubbleSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBubbleSeriesForm::CheckBox2Click(TObject *Sender)
{
  Series1->Marks->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TBubbleSeriesForm::CheckBox3Click(TObject *Sender)
{
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

TSeriesPointerStyle __fastcall TBubbleSeriesForm::Series1GetPointerStyle(
      TChartSeries *Sender, int ValueIndex)
{
  TSeriesPointerStyle Res;
  int Elements = ComboBox1->Items->Count;
  if (CheckBox3->Checked) Res = TSeriesPointerStyle(random(Elements-1));
  else Res = Series1->Pointer->Style;

  return Res;
}
//---------------------------------------------------------------------------

void __fastcall TBubbleSeriesForm::ZoomInButtonClick(TObject *Sender)
{
  Chart1->ZoomPercent(110);
}
//---------------------------------------------------------------------------

void __fastcall TBubbleSeriesForm::ZoomOutButtonClick(TObject *Sender)
{
  Chart1->ZoomPercent(90);
}
//---------------------------------------------------------------------------

void __fastcall TBubbleSeriesForm::ComboBox1Change(TObject *Sender)
{
  Series1->Pointer->Style =  TSeriesPointerStyle(ComboBox1->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TBubbleSeriesForm::FormCreate(TObject *Sender)
{
  Series1->Clear();
  for (int t=1; t<101; t++)
      Series1->AddBubble( Date()+t,                          // <-- x value
                         random(ChartSamplesMax),         // <-- y value
                         ChartSamplesMax/double(20+random(25)), // <-- radius value
                         "",                              // <-- label string
                         GetDefaultColor(t));             // <-- color
}
//---------------------------------------------------------------------------

void __fastcall TBubbleSeriesForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = int(psCircle); // <-- Circled Bubbles by default
}
//---------------------------------------------------------------------------

