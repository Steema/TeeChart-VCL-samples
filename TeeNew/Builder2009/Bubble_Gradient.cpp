//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bubble_Gradient.h"
#include "TeeEdiGrad.hpp"
#include "TeCanvas.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBubbleGradient *BubbleGradient;
//---------------------------------------------------------------------------
__fastcall TBubbleGradient::TBubbleGradient(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBubbleGradient::CheckBox1Click(TObject *Sender)
{
  Series1->Pointer->Gradient->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TBubbleGradient::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  Series1->Pointer->Gradient->Visible = true;
  Series1->Pointer->Gradient->Direction = gdRadial;
  Series1->ValueColor[4] = clAqua;
}
//---------------------------------------------------------------------------

void __fastcall TBubbleGradient::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Series1->Pointer->Gradient,true,false);
}
//---------------------------------------------------------------------------

// Expand horizontal axis to fit first and last bubble...
void __fastcall TBubbleGradient::Button2Click(TObject *Sender)
{
  double tmp = Series1->GetVertAxis->CalcSizeValue(Series1->RadiusValues->First());
  Series1->GetHorizAxis->MinimumOffset = tmp;

  tmp = Series1->GetVertAxis->CalcSizeValue(Series1->RadiusValues->Last());
  Series1->GetHorizAxis->MaximumOffset = tmp;
}
//---------------------------------------------------------------------------

