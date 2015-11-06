//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "HorizLine_Series.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma resource "*.dfm"
THorizLineForm *HorizLineForm;
//---------------------------------------------------------------------------
__fastcall THorizLineForm::THorizLineForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THorizLineForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

void __fastcall THorizLineForm::CheckBox1Click(TObject *Sender)
{
  Series1->Stairs = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

