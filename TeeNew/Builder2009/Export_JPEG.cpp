//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_JPEG.h"
#include "TeeJPEG.hpp"
#include "TeExport.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeJPEG"
#pragma resource "*.dfm"
TJPEGExportForm *JPEGExportForm;
//---------------------------------------------------------------------------
__fastcall TJPEGExportForm::TJPEGExportForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TJPEGExportForm::Button1Click(TObject *Sender)
{
  TeeSavePanel(__classid(TJPEGExportFormat),Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TJPEGExportForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TJPEGExportForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

