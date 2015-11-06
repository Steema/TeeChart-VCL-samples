//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Basic_Features.h"
#include <Series.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeEdit"
#pragma resource "*.dfm"
TBasicFeatures *BasicFeatures;
//---------------------------------------------------------------------------
__fastcall TBasicFeatures::TBasicFeatures(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBasicFeatures::Button1Click(TObject *Sender)
{
  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TBasicFeatures::Button2Click(TObject *Sender)
{
  MyChart->RemoveAllSeries();

  MyChart->AddSeries(new TBarSeries(this));

  MyChart->Series[0]->Clear();
  MyChart->Series[0]->Add( 123, "ABC", clRed );
  MyChart->Series[0]->Add( 456, "DEF", clBlue );
  MyChart->Series[0]->Add( 321, "GHI", clGreen );

  MyChart->Series[0]->Marks->Style = smsValue;
}
//---------------------------------------------------------------------------

