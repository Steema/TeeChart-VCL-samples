//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_ImagePoint.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "ImaPoint"
#pragma resource "*.dfm"
TImagePointForm *ImagePointForm;
//---------------------------------------------------------------------------
__fastcall TImagePointForm::TImagePointForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TImagePointForm::Image1Click(TObject *Sender)
{
  if (OpenPictureDialog1->Execute())
  {
    Series1->ImagePoint->LoadFromFile(OpenPictureDialog1->FileName);
    Image1->Picture->Assign(Series1->ImagePoint);
  }
}
//---------------------------------------------------------------------------

void __fastcall TImagePointForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Image1->Picture->Assign(Series1->ImagePoint);
  UpDown1->Position = Series1->Pointer->HorizSize;
  UpDown2->Position = Series1->Pointer->VertSize;
}
//---------------------------------------------------------------------------

void __fastcall TImagePointForm::Edit1Change(TObject *Sender)
{
  if (this->Showing) Series1->Pointer->HorizSize = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TImagePointForm::Edit2Change(TObject *Sender)
{
  if (this->Showing) Series1->Pointer->VertSize = UpDown2->Position;
}
//---------------------------------------------------------------------------

