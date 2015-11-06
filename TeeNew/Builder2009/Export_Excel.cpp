//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_Excel.h"
#include "TeeStore.hpp"
#include "TeExport.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TExportExcelForm *ExportExcelForm;
//---------------------------------------------------------------------------
__fastcall TExportExcelForm::TExportExcelForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExportExcelForm::ShowSavedFile()
{
  TeeGotoURL(int(Handle),SaveDialog1->FileName);
}
//---------------------------------------------------------------------------
void __fastcall TExportExcelForm::Button1Click(TObject *Sender)
{
  if (SaveDialog1->Execute())
  {
    // NULL = all series in Chart1 }
    TSeriesDataXLS *tmp= new TSeriesDataXLS(Chart1,NULL);
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

void __fastcall TExportExcelForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------


void __fastcall TExportExcelForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
  Series4->FillSampleValues(6);
}
//---------------------------------------------------------------------------

