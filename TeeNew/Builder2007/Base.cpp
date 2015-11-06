//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Base.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TBaseForm *BaseForm;
//---------------------------------------------------------------------------
__fastcall TBaseForm::TBaseForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBaseForm::Memo1DblClick(TObject *Sender)
{
  EditChart(this,Chart1);
}
//---------------------------------------------------------------------------

