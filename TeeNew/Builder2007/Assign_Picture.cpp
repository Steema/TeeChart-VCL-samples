//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Assign_Picture.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TAssignPicture *AssignPicture;
//---------------------------------------------------------------------------
__fastcall TAssignPicture::TAssignPicture(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAssignPicture::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

void __fastcall TAssignPicture::Button1Click(TObject *Sender)
{
  Image1->Picture->Assign(Chart1);
}
//---------------------------------------------------------------------------

