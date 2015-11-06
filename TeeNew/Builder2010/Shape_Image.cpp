//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Shape_Image.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TShapeImage *ShapeImage;
//---------------------------------------------------------------------------
__fastcall TShapeImage::TShapeImage(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TShapeImage::CheckBox1Click(TObject *Sender)
{
  Series1->Transparent = CheckBox1->Checked;
  Series2->Transparent = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

