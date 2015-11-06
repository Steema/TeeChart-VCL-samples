//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_Image.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBarImage *BarImage;
//---------------------------------------------------------------------------
__fastcall TBarImage::TBarImage(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarImage::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(3);
  Series2->FillSampleValues(3);

  CheckBox1Click(this);
}
//---------------------------------------------------------------------------

void __fastcall TBarImage::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    // the ImageList contains the patterns for this example
    ImageList1->GetBitmap(0,Series1->BarBrush->Image->Bitmap);
    ImageList1->GetBitmap(1,Series2->BarBrush->Image->Bitmap);
  }
  else
  {
    Series1->BarBrush->Image->Assign(NULL);
    Series2->BarBrush->Image->Assign(NULL);
  }
}
//---------------------------------------------------------------------------

