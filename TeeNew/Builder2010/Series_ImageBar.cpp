//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_ImageBar.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "ImageBar"
#pragma resource "*.dfm"
TImageBarForm *ImageBarForm;
//---------------------------------------------------------------------------
__fastcall TImageBarForm::TImageBarForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TImageBarForm::CheckBox1Click(TObject *Sender)
{
  Series1->ImageTiled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TImageBarForm::Image1Click(TObject *Sender)
{
  if (OpenPictureDialog1->Execute())
  {
    Series1->Image->LoadFromFile(OpenPictureDialog1->FileName);
    Image1->Picture->Assign(Series1->Image);
  }
}
//---------------------------------------------------------------------------

void __fastcall TImageBarForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Image1->Picture->Assign(Series1->Image);
  ButtonColor1->LinkProperty(Series1,"SeriesColor");
}
//---------------------------------------------------------------------------

void __fastcall TImageBarForm::CheckBox2Click(TObject *Sender)
{
  Series1->ColorEachPoint = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

