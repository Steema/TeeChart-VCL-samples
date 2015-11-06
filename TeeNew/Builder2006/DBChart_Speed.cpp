//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_Speed.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma resource "*.dfm"
TDBChartSpeed *DBChartSpeed;
//---------------------------------------------------------------------------
__fastcall TDBChartSpeed::TDBChartSpeed(TComponent* Owner)
        : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBChartSpeed::CheckBox1Click(TObject *Sender)
{
  Table1->Active = CheckBox1->Checked;
  Label1->Visible = CheckBox1->Checked;
  if (Table1->Active)
    Label1->Caption = "Processed records: "+IntToStr(Table1->RecordCount);
}
//---------------------------------------------------------------------------

void __fastcall TDBChartSpeed::FormShow(TObject *Sender)
{
  CheckTable(Table1);
}
//---------------------------------------------------------------------------

