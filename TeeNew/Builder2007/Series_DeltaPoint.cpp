//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_DeltaPoint.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "ImaPoint"
#pragma resource "*.dfm"
TDeltaPointForm *DeltaPointForm;
//---------------------------------------------------------------------------
__fastcall TDeltaPointForm::TDeltaPointForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDeltaPointForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);

  Image1->Picture->Assign(Series1->LowerImage);
  Image2->Picture->Assign(Series1->EqualImage);
  Image3->Picture->Assign(Series1->GreaterImage);
}
//---------------------------------------------------------------------------

void __fastcall TDeltaPointForm::Image1Click(TObject *Sender)
{
  if (OpenPictureDialog1->Execute())
  {
    TImage *tmp = dynamic_cast<TImage*>(Sender);
    tmp->Picture->LoadFromFile(OpenPictureDialog1->FileName);
    if (tmp == Image1) Series1->LowerImage->Assign(tmp->Picture);
    else if (tmp == Image2) Series1->EqualImage->Assign(tmp->Picture);
    else if (tmp == Image3) Series1->GreaterImage->Assign(tmp->Picture);
  }
}
//---------------------------------------------------------------------------

