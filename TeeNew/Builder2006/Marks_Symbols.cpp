//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_Symbols.h"
#include "TeeEdiSeri.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarkSymbols *MarkSymbols;
//---------------------------------------------------------------------------
__fastcall TMarkSymbols::TMarkSymbols(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarkSymbols::CheckBox1Click(TObject *Sender)
{
  Series1->Marks->Symbol->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TMarkSymbols::Button1Click(TObject *Sender)
{
  // missing some code
  /*
  try
  {
    frm->ShowModal();
  }
  __finally
  {
    delete *frm;
  }
  */
}
//---------------------------------------------------------------------------

void __fastcall TMarkSymbols::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

