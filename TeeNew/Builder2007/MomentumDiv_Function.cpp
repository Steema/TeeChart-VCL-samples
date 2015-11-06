//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MomentumDiv_Function.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TMomentumDivForm *MomentumDivForm;
//---------------------------------------------------------------------------
__fastcall TMomentumDivForm::TMomentumDivForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMomentumDivForm::CheckBox1Click(TObject *Sender)
{
  // show / hide the momentum series
  Series2->Active = CheckBox1->Checked;

  // re-position the axis
  if (Series2->Active) Chart1->LeftAxis->EndPosition = 80;
  else Chart1->LeftAxis->EndPosition = 100;

  // show / hide the custom right axis
  Chart1->CustomAxes->Items[0]->Visible = Series2->Active;

  // show / hide the blue color line
  ChartTool1->Active = Series2->Active;
}
//---------------------------------------------------------------------------

void __fastcall TMomentumDivForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(50);

  // set the correct position for the blue line...
  ChartTool1->Value = Series1->YValues->MinValue;

  // function is = 100 * Value / (Previous 10th value)
  TeeFunction1->Period = 10;
}
//---------------------------------------------------------------------------

void __fastcall TMomentumDivForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

