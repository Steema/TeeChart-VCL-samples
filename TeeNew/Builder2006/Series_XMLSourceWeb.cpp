//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_XMLSourceWeb.h"
#include <TeeXML.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TXMLSourceWeb *XMLSourceWeb;
//---------------------------------------------------------------------------
__fastcall TXMLSourceWeb::TXMLSourceWeb(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TXMLSourceWeb::LoadXML(void)
{
  TTeeXMLSource *xmlsource = new TTeeXMLSource(this);
  try
  {
    xmlsource->FileName = Edit1->Text; // <-- set Web URL address
    xmlsource->Chart = Chart1;        // <-- set Chart
    xmlsource->Load();                 // <-- retrieve data and create series
  }
  __finally
  {
    delete xmlsource;
  }
}
void __fastcall TXMLSourceWeb::Button1Click(TObject *Sender)
{
  Screen->Cursor = crHourGlass;
  try
  {
    LoadXML();
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
}
//---------------------------------------------------------------------------

