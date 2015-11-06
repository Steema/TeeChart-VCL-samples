//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Designer.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSeriesDesigner *SeriesDesigner;
//---------------------------------------------------------------------------
__fastcall TSeriesDesigner::TSeriesDesigner(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
