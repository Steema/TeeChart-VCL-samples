//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_SummaryOrder.h"
#include "TeeDBSumEdit.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma resource "*.dfm"
TDBSummaryOrder *DBSummaryOrder;
//---------------------------------------------------------------------------
__fastcall TDBSummaryOrder::TDBSummaryOrder(TComponent* Owner)
  : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBSummaryOrder::Button1Click(TObject *Sender)
{
  TeeDBSummaryEditor(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TDBSummaryOrder::CheckBox1Click(TObject *Sender)
{
  CheckTable(Table1);

  // Open - close the table
  Table1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDBSummaryOrder::ComboFlat1Change(TObject *Sender)
{
  Table1->Close();
  switch (ComboFlat1->ItemIndex)
  {
    case 0:{
            Series1->XLabelsSource = "Pay_Method";
            Series1->XValues->Order = loNone;
           } break;
    case 1:{
            Series1->XLabelsSource = "Pay_Method";
            Series1->XValues->Order = loAscending;
           } break;
    case 2:{
            Series1->XLabelsSource = "#SORTDES#Pay_Method";
            Series1->XValues->Order = loNone;
           } break;
  }

  Table1->Open();
  CheckBox1->Checked = true;
}
//---------------------------------------------------------------------------

void __fastcall TDBSummaryOrder::FormCreate(TObject *Sender)
{
  DBChart1->Legend->Inverted = true;
  ComboFlat1->ItemIndex =1; // sort by calculation
}
//---------------------------------------------------------------------------

