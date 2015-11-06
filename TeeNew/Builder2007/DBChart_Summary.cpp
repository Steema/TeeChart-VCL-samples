//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_Summary.h"
#include "TeeDBSumEdit.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma resource "*.dfm"
TDBChartSummary *DBChartSummary;
//---------------------------------------------------------------------------
__fastcall TDBChartSummary::TDBChartSummary(TComponent* Owner)
        : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBChartSummary::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->XLabelsSource = "EmpNo"; break;
    case 1: Series1->XLabelsSource = "PaymentMethod"; break;
    case 2: Series1->XLabelsSource = "#Year#SaleDate"; break;
    case 3: Series1->XLabelsSource = "ShipVia"; break;
    case 4: Series1->XLabelsSource = "Terms"; break;
  }
  Series1->SeriesColor = GetDefaultColor(ComboBox1->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TDBChartSummary::ComboBox2Change(TObject *Sender)
{
  switch (ComboBox2->ItemIndex)
  {
    case 0: Series1->YValues->ValueSource = "#Sum#AmountPaid"; break;
    case 1: Series1->YValues->ValueSource = "#Count#AmountPaid"; break;
    case 2: Series1->YValues->ValueSource = "#High#AmountPaid"; break;
    case 3: Series1->YValues->ValueSource = "#Low#AmountPaid"; break;
    case 4: Series1->YValues->ValueSource = "#Avg#AmountPaid"; break;
  }

}
//---------------------------------------------------------------------------

void __fastcall TDBChartSummary::Button1Click(TObject *Sender)
{
  TDBChartSumEditor *Editor = new TDBChartSumEditor(this);
  try
  {
    Editor->Tag = int(Series1);
    Editor->BorderStyle = bsDialog;
    Editor->Caption = "Summary properties";
    Editor->ShowModal();
  }
  __finally
  {
    delete Editor;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDBChartSummary::CheckBox1Click(TObject *Sender)
{
  CheckTable(Table1);
  Table1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDBChartSummary::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 3;
  ComboBox2->ItemIndex = 0;
}
//---------------------------------------------------------------------------

