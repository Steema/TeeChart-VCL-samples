//---------------------------------------------------------------------------

#include <vcl.h>
#include <TeCanvas.hpp>
#pragma hdrstop

#include "Gradient_MidColor.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TGradientMiddle *GradientMiddle;
//---------------------------------------------------------------------------
__fastcall TGradientMiddle::TGradientMiddle(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGradientMiddle::FormCreate(TObject *Sender)
{
  Shape1->Brush->Color =Chart1->Gradient->MidColor;
}
//---------------------------------------------------------------------------

void __fastcall TGradientMiddle::Shape1MouseUp(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  Chart1->Gradient->MidColor = EditColor(this,Chart1->Gradient->MidColor);
  Shape1->Brush->Color = Chart1->Gradient->MidColor;
}
//---------------------------------------------------------------------------

void __fastcall TGradientMiddle::CheckBox1Click(TObject *Sender)
{
  Shape1->Visible != CheckBox1->Checked;
  if (CheckBox1->Checked) Chart1->Gradient->MidColor = clNone;
  else Chart1->Gradient->MidColor = Shape1->Brush->Color;
}
//---------------------------------------------------------------------------

