//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Shape.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TShapeSeriesForm *ShapeSeriesForm;
//---------------------------------------------------------------------------
__fastcall TShapeSeriesForm::TShapeSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TShapeSeriesForm::CheckBox1Click(TObject *Sender)
{
  for (int t=0; t<Chart1->SeriesCount(); t++)
    if (dynamic_cast<TChartShape*>(Chart1->Series[t]))
      dynamic_cast<TChartShape*>(Chart1->Series[t])->Transparent = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TShapeSeriesForm::Series1Click(TChartSeries *Sender,
      int ValueIndex, TMouseButton Button, TShiftState Shift, int X, int Y)
{
  EditSeries(this,Sender); // when a shape is clicked...
  Chart1->CancelMouse = true; // stop mouse zooming
}
//---------------------------------------------------------------------------

