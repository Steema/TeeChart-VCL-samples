//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_MasterDetail.h"
#include "Base_DBChart.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TLinkedTablesForm *LinkedTablesForm;
//---------------------------------------------------------------------------
__fastcall TLinkedTablesForm::TLinkedTablesForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLinkedTablesForm::DataSource1DataChange(TObject *Sender,
      TField *Field)
{
 /* Force DBChart to refresh the detail records
   when the master record changes. */
  DBChart1->CheckDatasource(AreaSeries1);
}
//---------------------------------------------------------------------------

void __fastcall TLinkedTablesForm::CheckBox1Click(TObject *Sender)
{
  CheckTable(Table1);
  CheckTable(Table2);
  Table1->Active = CheckBox1->Checked;
  Table2->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

