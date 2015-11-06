//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Mouse_Wheel.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMouseWheelForm *MouseWheelForm;
//---------------------------------------------------------------------------
__fastcall TMouseWheelForm::TMouseWheelForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMouseWheelForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
     Chart1->Panning->MouseWheel = pmwNormal;
  else
     Chart1->Panning->MouseWheel = pmwNone;

  Chart1->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TMouseWheelForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
  Chart1->TabStop = true;
}
//---------------------------------------------------------------------------

void __fastcall TMouseWheelForm::Chart1Click(TObject *Sender)
{
  if (!Chart1->Focused()) Chart1->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TMouseWheelForm::FormShow(TObject *Sender)
{
  if (Mouse->WheelPresent) LabelMouse->Caption = "Mouse Wheel Present !";
  else LabelMouse->Caption = "Your Mouse has no Wheel. Sorry :(";
}
//---------------------------------------------------------------------------

