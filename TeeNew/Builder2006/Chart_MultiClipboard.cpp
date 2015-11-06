//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_MultiClipboard.h"
#include <Clipbrd.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartMultiClipboard *ChartMultiClipboard;
//---------------------------------------------------------------------------
__fastcall TChartMultiClipboard::TChartMultiClipboard(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartMultiClipboard::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(26);
}
//---------------------------------------------------------------------------
  void __fastcall DrawChart(TCustomChart *Chart, TRect Rect, Graphics::TBitmap *Bitmap)
  {
    // disable using the internal "buffer" image...
    Chart->BufferedDisplay = false;
    try
    {
       // draw the chart to the bitmap at the "Rect" position...
       Chart->Draw(Bitmap->Canvas,Rect);
    }
    __finally
    {
      // enable again the internal buffer image...
      Chart->BufferedDisplay = true;
    }
  }

void __fastcall TChartMultiClipboard::Button1Click(TObject *Sender)
{
  // create a temporary bitmap image... }
  Graphics::TBitmap *Bitmap = new Graphics::TBitmap();
  try
  {
    // set the bitmap dimensions...
    Bitmap->Width = 500;
    Bitmap->Height = 300;

    // draw the 3 charts...
    DrawChart(Chart1,Rect(251,0,500-1,125), Bitmap);
    DrawChart(Chart2,Rect(0,0,250,125), Bitmap);
    DrawChart(Chart3,Rect(0,126,500-1,300-1), Bitmap);

    // finally, copy the image to clipboard...
    Clipboard()->Assign(Bitmap);
  }
  __finally
  {
    // remove the temporary bitmap...
    delete Bitmap;
  }
}
//---------------------------------------------------------------------------

