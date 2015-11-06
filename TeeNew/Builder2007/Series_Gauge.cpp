//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Gauge.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeGauges"
#pragma resource "*.dfm"
TGaugeDemo *GaugeDemo;
//---------------------------------------------------------------------------
__fastcall TGaugeDemo::TGaugeDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGaugeDemo::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);

  // fix scrollbar
  ScrollBar1->Min = (int)Series1->Minimum;
  ScrollBar1->Max = (int)Series1->Maximum;
  ScrollBar1->Position = (int)Series1->Value;

  Label2->Caption = FloatToStr(Series1->Value);
}
//---------------------------------------------------------------------------

void __fastcall TGaugeDemo::ScrollBar1Change(TObject *Sender)
{
  Series1->Value = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TGaugeDemo::Series1Change(TObject *Sender)
{
  Label2->Caption = FloatToStr(Series1->Value);
}
//---------------------------------------------------------------------------

