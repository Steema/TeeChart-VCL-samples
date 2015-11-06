//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_GIF.h"
#include "TeeGIF.hpp"
#include "TeExport.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeGIF"
#pragma resource "*.dfm"
TGIFExportForm *GIFExportForm;
//---------------------------------------------------------------------------
__fastcall TGIFExportForm::TGIFExportForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGIFExportForm::Button1Click(TObject *Sender)
{
  TeeSavePanel(__classid(TGIFExportFormat),Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TGIFExportForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TGIFExportForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

