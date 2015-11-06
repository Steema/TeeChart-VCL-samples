//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pie_Semi.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPieSemi *PieSemi;
//---------------------------------------------------------------------------
__fastcall TPieSemi::TPieSemi(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieSemi::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);

  Series1->AngleSize = 180;
  Series1->RotationAngle = 90;
}
//---------------------------------------------------------------------------

void __fastcall TPieSemi::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) Series1->AngleSize = 180;
  else Series1->AngleSize = 360;
}
//---------------------------------------------------------------------------

void __fastcall TPieSemi::CheckBox2Click(TObject *Sender)
{
  if (CheckBox2->Checked) Series1->RotationAngle = 90;
  else Series1->RotationAngle = 0;
}
//---------------------------------------------------------------------------

