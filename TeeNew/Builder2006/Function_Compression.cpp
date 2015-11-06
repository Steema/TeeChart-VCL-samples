//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Compression.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TCompressionDemo *CompressionDemo;
//---------------------------------------------------------------------------
__fastcall TCompressionDemo::TCompressionDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCompressionDemo::FormCreate(TObject *Sender)
{
  // Example: How to create a Compression function
  Compression = new TCompressFunction(this);

  // Set function to Series2
  Series2->DataSource =Series1;
  Series2->SetFunction(Compression);

  // Sample Candle values
  Series1->FillSampleValues(500);

  ComboBox1->ItemIndex = 0;
  ComboBox2->ItemIndex = 1;
}
//---------------------------------------------------------------------------

void __fastcall TCompressionDemo::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0)   // No Compression
  {
    // Show original data and hide compression series
    Series1->Visible = true;
    Series2->Visible = false;
  }
  else
  {
    // Show compression series and hide original data
    Series1->Visible = false;
    Series2->Visible = true;

    // Set compression datetime period:

    switch (ComboBox1->ItemIndex)
    {
      case 1: Compression->Compress = ocWeek; break;
      case 2: Compression->Compress = ocMonth; break;
      case 3: Compression->Compress = ocBiMonth; break;
      case 4: Compression->Compress = ocQuarter; break;
      case 5: Compression->Compress = ocYear; break;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TCompressionDemo::ComboBox2Change(TObject *Sender)
{
  // Switch between different display modes
  switch (ComboBox2->ItemIndex)
  {
    case 0: Series1->CandleStyle = csCandleStick; break;
    case 1: Series1->CandleStyle = csCandleBar; break;
    default : Series1->CandleStyle = csOpenClose;
  }

  // Set compression Series2 style
  Series2->CandleStyle = Series1->CandleStyle;
}
//---------------------------------------------------------------------------

