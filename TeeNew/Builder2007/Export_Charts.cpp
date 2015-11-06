//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
#include "Export_Charts.h"
#include "TeeJPEG.hpp"
#include "TeeGIF.hpp"
#include "TeePNG.hpp"
#include "TeExport.hpp";
TExportChartsForm *ExportChartsForm;
//---------------------------------------------------------------------------
__fastcall TExportChartsForm::TExportChartsForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExportChartsForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TExportChartsForm::Button1Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

