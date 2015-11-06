//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Gallery_Panel.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeGalleryPanel"
#pragma resource "*.dfm"
TGalleryPanelForm *GalleryPanelForm;
//---------------------------------------------------------------------------
__fastcall TGalleryPanelForm::TGalleryPanelForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGalleryPanelForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);

  ChartGalleryPanel1->NumCols = 2;
  ChartGalleryPanel1->NumRows = 3;
  TChartSeriesClass list[4] = {__classid(TLineSeries),__classid(TBarSeries),__classid(TAreaSeries),__classid(TPieSeries)};
  ChartGalleryPanel1->CreateChartList(EXISTINGARRAY(list));
}
//---------------------------------------------------------------------------

void __fastcall TGalleryPanelForm::ChartGalleryPanel1ChangeChart(
      TObject *Sender)
{
  TChartSeries *tmpSeries = ChartGalleryPanel1->SelectedChart->Series[0];
  Label1->Caption =GetGallerySeriesName(tmpSeries);
  ChangeAllSeriesType(Chart1,tmpSeries->ClassType());
}
//---------------------------------------------------------------------------

