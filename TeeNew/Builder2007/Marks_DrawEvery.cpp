//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_DrawEvery.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksEvery *MarksEvery;
//---------------------------------------------------------------------------
__fastcall TMarksEvery::TMarksEvery(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksEvery::Edit1Change(TObject *Sender)
{
  Series1->Marks->DrawEvery = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TMarksEvery::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(50);
}
//---------------------------------------------------------------------------

