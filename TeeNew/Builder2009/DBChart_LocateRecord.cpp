//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_LocateRecord.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma resource "*.dfm"
TDBChartRecordLocate *DBChartRecordLocate;
//---------------------------------------------------------------------------
__fastcall TDBChartRecordLocate::TDBChartRecordLocate(TComponent* Owner)
        : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBChartRecordLocate::CheckBox1Click(TObject *Sender)
{
  Table1->Active = CheckBox1->Checked;  // open the table
}
//---------------------------------------------------------------------------

void __fastcall TDBChartRecordLocate::FormShow(TObject *Sender)
{
  CheckTable(Table1);  // set the Database (dbdemos or bddemos)
}
//---------------------------------------------------------------------------

void __fastcall TDBChartRecordLocate::FormDestroy(TObject *Sender)
{
  for (int t = Bookmarks.Low; t< Bookmarks.High; t++)
  {
    Table1->FreeBookmark(Bookmarks[t]);
  }
  Bookmarks.Length = 0;
}
//---------------------------------------------------------------------------

void __fastcall TDBChartRecordLocate::DBChart1ClickSeries(
      TCustomChart *Sender, TChartSeries *Series, int ValueIndex,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  Table1->GotoBookmark(Bookmarks[ValueIndex]);
}
//---------------------------------------------------------------------------

void __fastcall TDBChartRecordLocate::Series1AfterAdd(TChartSeries *Sender,
      int ValueIndex)
{
  if (Bookmarks.Length < ValueIndex+1) Bookmarks.Length = (1+ValueIndex);
  Bookmarks[ValueIndex] = Table1->GetBookmark();
}
//---------------------------------------------------------------------------

