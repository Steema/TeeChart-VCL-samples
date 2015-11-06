//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_PDF.h"
#include "TeePDFCanvas.hpp"
#include "TeExport.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TPDFExportForm *PDFExportForm;
//---------------------------------------------------------------------------
__fastcall TPDFExportForm::TPDFExportForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPDFExportForm::Button1Click(TObject *Sender)
{
  TeeSavePanel(__classid(TPDFExportFormat),Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TPDFExportForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TPDFExportForm::FormCreate(TObject *Sender)
{
  Chart1->Color = clWhite;
  Chart1->BevelOuter = bvNone;
  Series1->FillSampleValues(7);
  Series2->FillSampleValues(7);
  Series3->FillSampleValues(7);
}
//---------------------------------------------------------------------------

