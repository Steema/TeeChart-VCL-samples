//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_Text.h"
#include "TeeStore.hpp"
#include "TeExport.hpp"
#include "TeeProcs.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TExportTextForm *ExportTextForm;
//---------------------------------------------------------------------------
__fastcall TExportTextForm::TExportTextForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExportTextForm::Button1Click(TObject *Sender)
{
  if (SaveDialog1->Execute())
  {
    // NULL = all series in Chart1
    TSeriesDataText *tmp = new TSeriesDataText(Chart1,NULL);
    try
    {
      tmp->TextDelimiter = char(",") ;  // try also: TeeTabDelimiter
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
void __fastcall TExportTextForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TExportTextForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(10);
  Series3->FillSampleValues(10);
}
//---------------------------------------------------------------------------
void __fastcall TExportTextForm::ShowSavedFile()
{
  TeeGotoURL(int(Handle),SaveDialog1->FileName);
}
//---------------------------------------------------------------------------

