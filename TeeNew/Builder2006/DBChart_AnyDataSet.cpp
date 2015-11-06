//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_AnyDataSet.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma resource "*.dfm"
TDBChartAny *DBChartAny;
//---------------------------------------------------------------------------
__fastcall TDBChartAny::TDBChartAny(TComponent* Owner)
        : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBChartAny::CheckBox1Click(TObject *Sender)
{
  Table1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDBChartAny::FormCreate(TObject *Sender)
{
  CheckTable(Table1);
}
//---------------------------------------------------------------------------

