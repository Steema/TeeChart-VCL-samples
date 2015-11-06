//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_SubGallery.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Chart_Gallery"
#pragma resource "*.dfm"
TChartSubGallery *ChartSubGallery;
//---------------------------------------------------------------------------
__fastcall TChartSubGallery::TChartSubGallery(TComponent* Owner)
        : TChartGallery(Owner)
{
}
//---------------------------------------------------------------------------
