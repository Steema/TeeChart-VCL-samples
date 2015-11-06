//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_CrossTab.h"
#include "Base_DBChart.h"
#include "TeeCross.h"  // <--- Include the TeeCross unit
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDBChartCrossTab *DBChartCrossTab;
//---------------------------------------------------------------------------
__fastcall TDBChartCrossTab::TDBChartCrossTab(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBChartCrossTab::RadioGroup1Click(TObject *Sender)
{
  // refresh the Chart showing the "sum" or the "count"...
  CrossTab();
}
//---------------------------------------------------------------------------
void __fastcall TDBChartCrossTab::CrossTab(void)
{
  TGroupFormula Summary;
  if (RadioGroup1->ItemIndex == 0) Summary = gfCount;
  else Summary = gfSum;

  FillDataSet(Table1,Series1,Dim1,Dim2,"AmountPaid",Summary);
}

void __fastcall TDBChartCrossTab::FormCreate(TObject *Sender)
{
  CheckTable(Table1);
}
//---------------------------------------------------------------------------

void __fastcall TDBChartCrossTab::Button1Click(TObject *Sender)
{
  // swap the cross-tab fields and refresh...
  AnsiString tmp = Dim1;
  Dim1 = Dim2;
  Dim2 = tmp;

  CrossTab();
}
//---------------------------------------------------------------------------

void __fastcall TDBChartCrossTab::CheckBox1Click(TObject *Sender)
{
  Table1->Open();
  RadioGroup1->Enabled = true;
  Button1->Enabled = true;
  CrossTab();
}
//---------------------------------------------------------------------------

void __fastcall TDBChartCrossTab::FormShow(TObject *Sender)
{
  Dim1 = "Terms";
  Dim2 = "ShipVia";
}
//---------------------------------------------------------------------------

