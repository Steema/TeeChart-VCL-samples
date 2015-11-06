//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_PrintPreview.h"
#include <TeePrevi.hpp>
#include <TeeEdiGene.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma link "TeeMapSeries"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TChartPrintPreviewForm *ChartPrintPreviewForm;
//---------------------------------------------------------------------------
__fastcall TChartPrintPreviewForm::TChartPrintPreviewForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartPrintPreviewForm::Button1Click(TObject *Sender)
{
  // WAY 1: using a single method...
  ChartPreview( this, Chart1);  //  <--- the easy way :)
}
//---------------------------------------------------------------------------

void __fastcall TChartPrintPreviewForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(15);
}
//---------------------------------------------------------------------------

void __fastcall TChartPrintPreviewForm::Button3Click(TObject *Sender)
{
  // WAY 3: Using the TChartPreviewer component
  ChartPreviewer1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TChartPrintPreviewForm::Button2Click(TObject *Sender)
{
  // WAY 2, customizing the print preview dialog

  // customize the preview dialog .... }
  TChartPreview *Prev = new TChartPreview(this);
  try
  {
    // IMPORTANT: set the chart to be previewed...
    Prev->PreviewPanel()->Panel = this->Chart1;

    // example: change the "paper color" }
    Prev->PreviewPanel()->PaperColor = clSilver;
    Prev->ShowModal();
  }
  __finally
  {
    delete Prev;
  }

}
//---------------------------------------------------------------------------

