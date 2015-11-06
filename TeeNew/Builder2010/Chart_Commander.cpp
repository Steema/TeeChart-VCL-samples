//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Commander.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma resource "*.dfm"
TTeeCommanderForm *TeeCommanderForm;
//---------------------------------------------------------------------------
__fastcall TTeeCommanderForm::TTeeCommanderForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTeeCommanderForm::CheckBox1Click(TObject *Sender)
{
  TeeCommander1->Vertical = CheckBox1->Checked;
  if (TeeCommander1->Vertical) TeeCommander1->Align = alLeft;
  else TeeCommander1->Align = alTop;
}
//---------------------------------------------------------------------------

void __fastcall TTeeCommanderForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

