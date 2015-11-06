//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DesignTime_Options.h"
#include <TeeTranslate.hpp>
#include <TeeDesignOptions.hpp>
#include <TeeGally.hpp>
#include "Chart_MultiLanguage.h"

#pragma link "TeeDesignOptions"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma resource "*.dfm"
TDesignTimeOptions *DesignTimeOptions;
//---------------------------------------------------------------------------
__fastcall TDesignTimeOptions::TDesignTimeOptions(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDesignTimeOptions::Button1Click(TObject *Sender)
{
  // Show the Options editor.
  // If user presses OK, settings are stored at Registry (or Inifile in Linux).
  TOptionsForm *oform = new TOptionsForm(this);
  try
  {
    oform->TabNewChart->Visible = false;
    oform->ShowModal();
  }
  __finally
  {
    delete oform;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDesignTimeOptions::Button2Click(TObject *Sender)
{
  TChartMultiLanguage::ChangeLanguage(TeeLanguageRegistry());
  ChartEditor1->TreeView = TeeReadBoolOption(TeeMsg_TreeMode,false);
  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TDesignTimeOptions::Button3Click(TObject *Sender)
{
  TChartMultiLanguage::ChangeLanguage(TeeLanguageRegistry());
  CreateNewSeriesGallery(GetParentForm(this), Chart1);
}
//---------------------------------------------------------------------------

