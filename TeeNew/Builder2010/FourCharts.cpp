//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "FourCharts.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFourChartsForm *FourChartsForm;
//---------------------------------------------------------------------------
__fastcall TFourChartsForm::TFourChartsForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFourChartsForm::FormCreate(TObject *Sender)
{
  // Some random points
  Summer->FillSampleValues(20);
  Winter->FillSampleValues(20);

  // We need a Bar Series with special random values,
  // so dont call the FillSampleValues method
  for (int t=1; t<13; t++)
    BarSeries1->Add(random(1000),
                    #if __BORLANDC__ >= 0x630  // RAD XE 2011
                    FormatSettings.
                    #endif
                    ShortMonthNames[t],
                    GetDefaultColor(t));

  South->FillSampleValues(20);
  North->FillSampleValues(20);

  Speaking->FillSampleValues(20);
  Reading->FillSampleValues(20);
  Writing->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TFourChartsForm::Button1Click(TObject *Sender)
{
 /* This code creates and stores a new BITMAP file
    which contains the FOUR charts.
    Asks previously the user the BMP filename.
 */
 if (SaveDialog1->Execute())
 {
   Graphics::TBitmap *b = new Graphics::TBitmap();
   try
   {
     // calculate bitmap size (2x2)
     int tmpW = Chart1->Width;
     int tmpH = Chart1->Height;
     b->Width = 2*tmpW;
     b->Height = 2*tmpH;
     // draw chart 1
     Chart1->BufferedDisplay = false;
     Chart1->Draw(b->Canvas,Rect(0,0,tmpW,tmpH));
     Chart1->BufferedDisplay = true;

     // draw chart 2
     Chart2->BufferedDisplay = false;
     Chart2->Draw(b->Canvas,Rect(0,tmpH+1,tmpW,2*tmpH));
     Chart2->BufferedDisplay = true;

     // draw chart 3
     Chart3->BufferedDisplay = false;
     Chart3->Draw(b->Canvas,Rect(tmpW+1,0,2*tmpW,tmpH));
     Chart3->BufferedDisplay = true;

     // draw chart 4
     Chart4->BufferedDisplay = false;
     Chart4->Draw(b->Canvas,Rect(tmpW+1,tmpH+1,2*tmpW,2*tmpH));
     Chart4->BufferedDisplay = true;
     b->SaveToFile(SaveDialog1->FileName);
   }
   __finally
   {
     delete b;
   }
 }
}
//---------------------------------------------------------------------------

