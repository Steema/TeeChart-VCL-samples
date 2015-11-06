//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Reporting_Tools.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TChartReports *ChartReports;
//---------------------------------------------------------------------------
__fastcall TChartReports::TChartReports(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

