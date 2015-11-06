//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_PCX.h"
#include "TeExport.hpp"
#include "TeePCX.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePCX"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TPCXExportForm *PCXExportForm;
//---------------------------------------------------------------------------
__fastcall TPCXExportForm::TPCXExportForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPCXExportForm::Button1Click(TObject *Sender)
{
  TeeSavePanel(__classid(TPCXExportFormat),Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TPCXExportForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TPCXExportForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(11);
}
//---------------------------------------------------------------------------

