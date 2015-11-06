//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_XMLSource.h"
#pragma link "TeeXML" // MS : is this fine ?
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TXMLSourceDemo *XMLSourceDemo;
//---------------------------------------------------------------------------
__fastcall TXMLSourceDemo::TXMLSourceDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TXMLSourceDemo::FormCreate(TObject *Sender)
{
  // Create a sample series...
  PointSeries = new TPointSeries(this);
  Chart1->AddSeries(PointSeries);

  // Create an XML source...
  XML = new TTeeXMLSource(this);

  // Configure XML...
  XML->XML->Text = Memo2->Text;   // <--- set text

  //  XML->FileName = "c:\\mydata.xml";

  XML->Series = PointSeries;    // <-- series to fill
  XML->SeriesNode = "Series1";  // <-- xml node to use
  XML->ValueSource = "Y";       // <-- xml "point" attribute to use as value

  // Load data, fill series...
  XML->Open();
}
//---------------------------------------------------------------------------

void __fastcall TXMLSourceDemo::Button1Click(TObject *Sender)
{
  // Configure XML...
  XML->XML->Assign(Memo2->Lines);   // <--- set text
  XML->Refresh();

  Button1->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TXMLSourceDemo::Memo2Change(TObject *Sender)
{
  Button1->Enabled = true;
}
//---------------------------------------------------------------------------

