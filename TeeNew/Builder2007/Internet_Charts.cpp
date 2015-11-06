//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Internet_Charts.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TInternetCharts *InternetCharts;
//---------------------------------------------------------------------------
__fastcall TInternetCharts::TInternetCharts(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
