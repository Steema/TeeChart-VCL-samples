//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_DotPen.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TCanvasDotPen *CanvasDotPen;
//---------------------------------------------------------------------------
__fastcall TCanvasDotPen::TCanvasDotPen(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCanvasDotPen::CheckBox1Click(TObject *Sender)
{
  TPenStyle tmp;
  if (CheckBox1->Checked) tmp = psDot;
  else tmp = psSolid;
  Series1->Pen->Style = tmp;
  Series2->Pen->Style = tmp;
  Series3->Pen->Style = tmp;
  Series4->Pen->Style = tmp;
}
//---------------------------------------------------------------------------

void __fastcall TCanvasDotPen::Edit1Change(TObject *Sender)
{
  Series1->Pen->Width = UpDown1->Position;
  Series2->Pen->Width = UpDown1->Position;
  Series3->Pen->Width = UpDown1->Position;
  Series4->Pen->Width = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TCanvasDotPen::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  Series2->FillSampleValues(20);
  Series3->FillSampleValues(20);
  Series4->FillSampleValues(20);

  // set big dotted pen
  Series1->Pen->Width =3; Series1->Pen->Style = psDot;
  Series2->Pen->Width =3; Series2->Pen->Style = psDot;
  Series3->Pen->Width =3; Series3->Pen->Style = psDot;
  Series4->Pen->Width =3; Series4->Pen->Style = psDot;
}
//---------------------------------------------------------------------------

