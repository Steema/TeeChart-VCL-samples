//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_WebSource.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma link "TeeURL"
#pragma resource "*.dfm"
TChartWebSourceForm *ChartWebSourceForm;
//---------------------------------------------------------------------------
__fastcall TChartWebSourceForm::TChartWebSourceForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartWebSourceForm::Button1Click(TObject *Sender)
{
  ChartWebSource1->URL = Edit1->Text;

  Screen->Cursor = crHourGlass;
  try
  {
    ChartWebSource1->Execute();
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
}
//---------------------------------------------------------------------------

