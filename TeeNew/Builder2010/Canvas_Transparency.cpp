//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_Transparency.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TTransparencyForm *TransparencyForm;
//---------------------------------------------------------------------------
__fastcall TTransparencyForm::TTransparencyForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTransparencyForm::ScrollBar1Change(TObject *Sender)
{
  Chart1->Title->Transparency = ScrollBar1->Position;
  Chart1->Legend->Transparency = ScrollBar1->Position;
  Chart1->BackWall->Transparency = ScrollBar1->Position;
  Label2->Caption = IntToStr(ScrollBar1->Position)+"%";
}
//---------------------------------------------------------------------------

void __fastcall TTransparencyForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  ScrollBar1Change(this);
}
//---------------------------------------------------------------------------

