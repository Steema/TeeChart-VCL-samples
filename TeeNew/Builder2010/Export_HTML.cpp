//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_HTML.h"
#include "TeeStore.hpp"
#include "TeExport.hpp"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TExportHTMLForm *ExportHTMLForm;
//---------------------------------------------------------------------------
__fastcall TExportHTMLForm::TExportHTMLForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExportHTMLForm::ShowSavedFile()
{
  TeeGotoURL(int(Handle),SaveDialog1->FileName);
}
//---------------------------------------------------------------------------
void __fastcall TExportHTMLForm::Button1Click(TObject *Sender)
{
  if (SaveDialog1->Execute())
  {
    // NULL = all series in Chart1 }
    TSeriesDataHTML *tmp= new TSeriesDataHTML(Chart1,NULL);
    try
    {
      tmp->IncludeIndex = CheckBox1->Checked;
      tmp->IncludeHeader = CheckBox2->Checked;
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

void __fastcall TExportHTMLForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TExportHTMLForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
  Series4->FillSampleValues(6);
}
//---------------------------------------------------------------------------

