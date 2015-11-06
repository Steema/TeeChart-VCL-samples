//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Clock_Editors.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "MyPoint"
#pragma link "TeePolar"
#pragma link "TeeRose"
#pragma resource "*.dfm"
TClockEdi *ClockEdi;
//---------------------------------------------------------------------------
__fastcall TClockEdi::TClockEdi(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TClockEdi::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TClockEdi::Button2Click(TObject *Sender)
{
  EditSeries(this,Series2);
}
//---------------------------------------------------------------------------

void __fastcall TClockEdi::FormCreate(TObject *Sender)
{
  Series2->FillSampleValues(6);
}
//---------------------------------------------------------------------------

