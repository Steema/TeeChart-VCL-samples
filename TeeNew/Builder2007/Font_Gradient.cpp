//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Font_Gradient.h"

#include "TeeEdiGrad.hpp"
#include "TeCanvas.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFontGradient *FontGradient;
//---------------------------------------------------------------------------
__fastcall TFontGradient::TFontGradient(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFontGradient::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Chart1->Title->Font->Gradient,false);
}
//---------------------------------------------------------------------------

void __fastcall TFontGradient::CheckBox1Click(TObject *Sender)
{
  Chart1->Title->Font->Gradient->Visible = CheckBox1->Checked;
  CheckBox2->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFontGradient::FormCreate(TObject *Sender)
{
  // Activate Font gradient:

  TTeeGradient *grad = Chart1->Title->Font->Gradient;
  grad->Visible = true;
  grad->StartColor = clNavy;
  grad->MidColor = clRed;
  grad->EndColor = clYellow;
  grad->Direction = gdLeftRight; // Note: Requires using "TeCanvas.pas" unit
}
//---------------------------------------------------------------------------

void __fastcall TFontGradient::CheckBox2Click(TObject *Sender)
{
  Chart1->Title->Font->Gradient->Outline = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

