//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Clipboard.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartClipboard *ChartClipboard;
//---------------------------------------------------------------------------
__fastcall TChartClipboard::TChartClipboard(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartClipboard::Button1Click(TObject *Sender)
{
  Chart1->CopyToClipboardBitmap();

  // custom size:
  // Chart1.CopyToClipboardBitmap( Rect( 0,0, 400, 200 ) );
}
//---------------------------------------------------------------------------

void __fastcall TChartClipboard::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(10);
  Series3->FillSampleValues(10);
}
//---------------------------------------------------------------------------

