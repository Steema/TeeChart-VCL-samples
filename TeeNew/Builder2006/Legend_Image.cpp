//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Image.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma link "TeeRose"
#pragma resource "*.dfm"
TLegendImage *LegendImage;
//---------------------------------------------------------------------------
__fastcall TLegendImage::TLegendImage(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendImage::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) Chart1->Legend->Brush->Image->Assign(Image1->Picture);
  else Chart1->Legend->Brush->Image->Assign(NULL);

}
//---------------------------------------------------------------------------

void __fastcall TLegendImage::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  Chart1->Legend->Brush->Image->Assign(Image1->Picture);
}
//---------------------------------------------------------------------------

