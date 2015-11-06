//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_PointFigure.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "OHLChart"
#pragma link "TeePointFigure"
#pragma resource "*.dfm"
TPointFigureDemo *PointFigureDemo;
//---------------------------------------------------------------------------
__fastcall TPointFigureDemo::TPointFigureDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPointFigureDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  Series1->BoxSize = 5;
}
//---------------------------------------------------------------------------

void __fastcall TPointFigureDemo::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

