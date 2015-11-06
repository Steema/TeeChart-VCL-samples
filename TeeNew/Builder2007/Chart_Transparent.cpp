//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Transparent.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartTransparent *ChartTransparent;
//---------------------------------------------------------------------------
__fastcall TChartTransparent::TChartTransparent(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartTransparent::Button1Click(TObject *Sender)
{
  // no border
  Chart1->BevelOuter = bvNone;

  // set transparent
  Chart1->Color = clNone;

  // copy to clipboard in metafile mode
  Chart1->CopyToClipboardMetafile(true);

  // restore previous color
  Chart1->Color = clBtnFace;

  // previous border
  Chart1->BevelOuter = bvRaised;
}
//---------------------------------------------------------------------------

void __fastcall TChartTransparent::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(9);
}
//---------------------------------------------------------------------------

