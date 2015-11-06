//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_Angle.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksAngle *MarksAngle;
//---------------------------------------------------------------------------
__fastcall TMarksAngle::TMarksAngle(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksAngle::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
}
//---------------------------------------------------------------------------

void __fastcall TMarksAngle::Edit1Change(TObject *Sender)
{
  Series1->Marks->Angle = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TMarksAngle::Button1Click(TObject *Sender)
{
  UpDown1->Position = 0;
}
//---------------------------------------------------------------------------

void __fastcall TMarksAngle::Button2Click(TObject *Sender)
{
  UpDown1->Position = 90;
}
//---------------------------------------------------------------------------

