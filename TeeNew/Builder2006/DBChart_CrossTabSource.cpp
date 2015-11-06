//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DBChart_CrossTabSource.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_DBChart"
#pragma link "TeeDBCrosstab"
#pragma link "TeeDBEdit"
#pragma resource "*.dfm"
TDBCrossTabSourceDemo *DBCrossTabSourceDemo;
//---------------------------------------------------------------------------
__fastcall TDBCrossTabSourceDemo::TDBCrossTabSourceDemo(TComponent* Owner)
  : TBaseDBChart(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBCrossTabSourceDemo::FormShow(TObject *Sender)
{
  CheckTable(Table1);
}
//---------------------------------------------------------------------------

void __fastcall TDBCrossTabSourceDemo::CheckBox1Click(TObject *Sender)
{
  Table1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDBCrossTabSourceDemo::RadioGroup1Click(TObject *Sender)
{
  if (RadioGroup1->ItemIndex == 0) DBCrossTabSource1->Formula = gfCount;
  else DBCrossTabSource1->Formula = gfSum;

  Table1->Open();
  DBCrossTabSource1->Open();
}
//---------------------------------------------------------------------------

void __fastcall TDBCrossTabSourceDemo::Button1Click(TObject *Sender)
{
  // Exchange (swap) GroupField with LabelsField
  AnsiString tmp = DBCrossTabSource1->GroupField;
  DBCrossTabSource1->GroupField = DBCrossTabSource1->LabelField;
  DBCrossTabSource1->LabelField = tmp;
  DBCrossTabSource1->Open();

  Table1->Open();
}
//---------------------------------------------------------------------------

