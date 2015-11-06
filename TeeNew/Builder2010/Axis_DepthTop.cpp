//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_DepthTop.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TDepthTopAxisForm *DepthTopAxisForm;
//---------------------------------------------------------------------------
__fastcall TDepthTopAxisForm::TDepthTopAxisForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDepthTopAxisForm::CheckBox1Click(TObject *Sender)
{
  Chart1->Axes->DepthTop->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDepthTopAxisForm::CheckBox2Click(TObject *Sender)
{
  Chart1->Axes->Depth->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDepthTopAxisForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

