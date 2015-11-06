//---------------------------------------------------------------------------

#include <vcl.h>
#include <signal.h>
#pragma hdrstop

#include "Base_DBChart.h"
#include "EditChar.hpp"
// to show Database DBChart editor dialogs
#include "DBEditCh.hpp"
#pragma link "DBEditCh"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TBaseDBChart *BaseDBChart;

//---------------------------------------------------------------------------
void __fastcall CheckTable(TTable *ATable)
{
   TStringList *tmp = new TStringList;
   try
   {
      Session->GetAliasNames(tmp);
      if (tmp->IndexOf(ATable->DatabaseName) == -1)
      {
        if (tmp->IndexOf("BCDEMOS") == -1) // throw exception
        { // missing code
        }
        ATable->DatabaseName = "BCDEMOS";
      }
   }
   __finally
   {
      delete tmp;
   }
}
//---------------------------------------------------------------------------
__fastcall TBaseDBChart::TBaseDBChart(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBaseDBChart::Memo1DblClick(TObject *Sender)
{
  EditChart(this,DBChart1);
}
//---------------------------------------------------------------------------

