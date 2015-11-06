//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Smith_Series.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSmith"
#pragma resource "*.dfm"
TSmithForm *SmithForm;
//---------------------------------------------------------------------------
__fastcall TSmithForm::TSmithForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSmithForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TSmithForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TSmithForm::CheckBox1Click(TObject *Sender)
{
  Series1->Circled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

