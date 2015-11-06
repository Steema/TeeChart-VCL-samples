//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pie_AutoMarkPosition.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPieAutoMarkPos *PieAutoMarkPos;
//---------------------------------------------------------------------------
__fastcall TPieAutoMarkPos::TPieAutoMarkPos(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieAutoMarkPos::CheckBox1Click(TObject *Sender)
{
  Series1->AutoMarkPosition = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPieAutoMarkPos::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(16);
}
//---------------------------------------------------------------------------

