//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_TextSource.h"
#include "TeeStore.hpp"
#include "TeeConst.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeURL"
#pragma resource "*.dfm"
TSeriesTextSourceForm *SeriesTextSourceForm;
//---------------------------------------------------------------------------
__fastcall TSeriesTextSourceForm::TSeriesTextSourceForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeriesTextSourceForm::UpdateMemo()
{
  /* TSeriesDataText object is used to export Series
     values to Text */
  TSeriesDataText *DT = new TSeriesDataText(Chart1,Series1);
  try
  {
    Memo2->Lines->Text = DT->AsString();
  }
  __finally
  {
    delete DT;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSeriesTextSourceForm::Button1Click(TObject *Sender)
{
  Series1->Clear();
  SeriesTextSource1->LoadFromStrings(Memo2->Lines);
}
//---------------------------------------------------------------------------

void __fastcall TSeriesTextSourceForm::Button2Click(TObject *Sender)
{
  Series1->Clear();
  Screen->Cursor = crHourGlass;
  try
  {
    // get points from the web...
    SeriesTextSource1->LoadFromURL(Edit1->Text);
    /* now set the SeriesTextSource properties
       to match the retrieved file... */
    SeriesTextSource1->HeaderLines = 0;
    SeriesTextSource1->FieldSeparator ="\t"; // tab
    SeriesTextSource1->Fields->Clear();
    SeriesTextSource1->AddField(TeeMsg_Text,1);
    SeriesTextSource1->AddField("X",2);
    SeriesTextSource1->AddField("Bar",3);
    // change the Memo contents with the Web file
    UpdateMemo();
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
}
//---------------------------------------------------------------------------

