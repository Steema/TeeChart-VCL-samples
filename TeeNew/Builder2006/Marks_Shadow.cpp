//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_Shadow.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksShadow *MarksShadow;
//---------------------------------------------------------------------------
__fastcall TMarksShadow::TMarksShadow(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksShadow::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) Series1->Marks->ShadowSize = UpDown1->Position;
  else Series1->Marks->ShadowSize = 0;
}
//---------------------------------------------------------------------------

void __fastcall TMarksShadow::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Shape1->Brush->Color = Series1->Marks->ShadowColor;
}
//---------------------------------------------------------------------------

void __fastcall TMarksShadow::Shape1MouseUp(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  TBrush *B = Shape1->Brush;
  B->Color = EditColor(this,B->Color);
  Series1->Marks->ShadowColor = B->Color;
}
//---------------------------------------------------------------------------

void __fastcall TMarksShadow::Edit1Change(TObject *Sender)
{
  Series1->Marks->ShadowSize = UpDown1->Position;
  CheckBox1->Checked = (Series1->Marks->ShadowSize > 0);
}
//---------------------------------------------------------------------------

