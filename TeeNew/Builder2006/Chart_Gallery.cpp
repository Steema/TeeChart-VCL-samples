//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Gallery.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartGallery *ChartGallery;
//---------------------------------------------------------------------------
__fastcall TChartGallery::TChartGallery(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartGallery::FormCreate(TObject *Sender)
{
  Chart1->Visible = false;
  Panel1->Visible = false;
  Gallery = new TTeeGallery(this);
  Gallery->Align = alClient;
  Gallery->BorderStyle = bsNone;
  Gallery->P1->Visible = false;
  Gallery->Parent =this;
}
//---------------------------------------------------------------------------

void __fastcall TChartGallery::FormShow(TObject *Sender)
{
  Gallery->Show();
}
//---------------------------------------------------------------------------

