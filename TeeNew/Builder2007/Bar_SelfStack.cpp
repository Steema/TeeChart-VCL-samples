//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_SelfStack.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBarSelfStack *BarSelfStack;
//---------------------------------------------------------------------------
__fastcall TBarSelfStack::TBarSelfStack(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarSelfStack::FormCreate(TObject *Sender)
{
  Series1->Add(100, "Cars");
  Series1->Add(300, "Phones");
  Series1->Add(200, "Lamps");

  // Set "Self-Stacked":
  Series1->MultiBar = Series::mbSelfStack;

  // cosmetic
  Series1->Marks->Visible = false;
  Series1->Marks->Style = smsValue;
  Series1->ColorEachPoint = true;
}
//---------------------------------------------------------------------------

void __fastcall TBarSelfStack::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) Series1->MultiBar = Series::mbSelfStack;
  else Series1->MultiBar = Series::mbNone;   // no stacking

  // show marks when not in self-stacking mode:
  Series1->Marks->Visible = !CheckBox1->Checked;

}
//---------------------------------------------------------------------------

