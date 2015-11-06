//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_PNG.h"
#include "TeExport.hpp"
#include "TeePNG.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePNG"
#pragma resource "*.dfm"
TPNGExportForm *PNGExportForm;
//---------------------------------------------------------------------------
__fastcall TPNGExportForm::TPNGExportForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPNGExportForm::Button1Click(TObject *Sender)
{
  TeeSavePanel(__classid(TPNGExportFormat),Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TPNGExportForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TPNGExportForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

