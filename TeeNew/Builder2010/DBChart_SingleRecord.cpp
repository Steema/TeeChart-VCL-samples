//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_SingleRecord.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma resource "*.dfm"
TDBChartSingleRecord *DBChartSingleRecord;
//---------------------------------------------------------------------------
__fastcall TDBChartSingleRecord::TDBChartSingleRecord(TComponent* Owner)
        : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBChartSingleRecord::FormCreate(TObject *Sender)
{
  CheckTable(Table1);
}
//---------------------------------------------------------------------------

void __fastcall TDBChartSingleRecord::CheckBox1Click(TObject *Sender)
{
  Table1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

