//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_XML.h"
#include "TeeStore.hpp"
#include "TeExport.hpp"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TExportXMLForm *ExportXMLForm;
//---------------------------------------------------------------------------
__fastcall TExportXMLForm::TExportXMLForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TExportXMLForm::ShowSavedFile()
{
  TeeGotoURL(int(Handle),SaveDialog1->FileName);
}
//---------------------------------------------------------------------------
void __fastcall TExportXMLForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
  Series4->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TExportXMLForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TExportXMLForm::Button1Click(TObject *Sender)
{
  if (SaveDialog1->Execute())
  {
    // NULL = all series in Chart1 }
    TSeriesDataXML *tmp= new TSeriesDataXML(Chart1,NULL);
    try
    {
      tmp->IncludeIndex = CheckBox1->Checked;
      tmp->SaveToFile(SaveDialog1->FileName);
      ShowSavedFile();
    }
    __finally
    {
      delete tmp;
    }
  }
}
//---------------------------------------------------------------------------

