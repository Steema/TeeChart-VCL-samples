//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_Order.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma resource "*.dfm"
TDBChartOrder *DBChartOrder;
//---------------------------------------------------------------------------
__fastcall TDBChartOrder::TDBChartOrder(TComponent* Owner)
        : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBChartOrder::FormShow(TObject *Sender)
{
  CheckTable(Table1);
}
//---------------------------------------------------------------------------

void __fastcall TDBChartOrder::RadioGroup1Click(TObject *Sender)
{
  switch (RadioGroup1->ItemIndex)
  {
    case 0: Series1->YValues->Order = loNone; break;
    case 1: Series1->YValues->Order = loAscending; break;
    case 2: Series1->YValues->Order = loDescending; break;
  }
  DBChart1->RefreshData();
}
//---------------------------------------------------------------------------

void __fastcall TDBChartOrder::CheckBox1Click(TObject *Sender)
{
  Table1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

