//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Line_Pattern.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLinePatternForm *LinePatternForm;
//---------------------------------------------------------------------------
__fastcall TLinePatternForm::TLinePatternForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLinePatternForm::Image1Click(TObject *Sender)
{
  if (OpenDialog1->Execute())
  {
    TImage *img = dynamic_cast<TImage*>(Sender);
    img->Picture->LoadFromFile(OpenDialog1->FileName);
    Chart1->Series[Tag]->Brush->Image->Assign(img->Picture);
  }
}
//---------------------------------------------------------------------------

void __fastcall TLinePatternForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  Series1->Brush->Image->Assign(Image1->Picture);

  Series2->FillSampleValues(8);
  Series2->Brush->Image->Assign(Image2->Picture);

  Series3->FillSampleValues(8);
  Series3->Brush->Image->Assign(Image3->Picture);
}
//---------------------------------------------------------------------------

