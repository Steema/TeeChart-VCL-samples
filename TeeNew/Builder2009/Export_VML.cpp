//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_VML.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeExport"
#pragma link "TeeVMLCanvas"
#pragma resource "*.dfm"
TExportVMLForm *ExportVMLForm;
//---------------------------------------------------------------------------
__fastcall TExportVMLForm::TExportVMLForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExportVMLForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
  Series4->FillSampleValues(6);
}
//---------------------------------------------------------------------------
void __fastcall TExportVMLForm::ShowSavedFile(void)
{
  TeeGotoURL(0,SaveDialog1->FileName);
}

void __fastcall TExportVMLForm::Button1Click(TObject *Sender)
{
  if (SaveDialog1->Execute())
  {
    TVMLExportFormat *Export=new TVMLExportFormat();
    Export->Panel=Chart1;
    Export->SaveToFile(SaveDialog1->FileName);
    ShowSavedFile();
    delete Export;
  }
}
//---------------------------------------------------------------------------

void __fastcall TExportVMLForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

