//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pyramid_Series.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePyramid"
#pragma resource "*.dfm"
TPyramidForm *PyramidForm;
//---------------------------------------------------------------------------
__fastcall TPyramidForm::TPyramidForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPyramidForm::CheckBox2Click(TObject *Sender)
{
  Series1->ColorEachPoint = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPyramidForm::CheckBox3Click(TObject *Sender)
{
  Chart1->LeftAxis->Inverted = CheckBox3->Checked; 
}
//---------------------------------------------------------------------------

void __fastcall TPyramidForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    Series1->ValueColor[2] = clNone;
    Series1->ValueColor[5] = clNone;
  }
  else
  {
    Series1->ValueColor[2] = clTeeColor;
    Series1->ValueColor[5] = clTeeColor;
  }
}
//---------------------------------------------------------------------------

void __fastcall TPyramidForm::Edit1Change(TObject *Sender)
{
  if (this->Showing) Series1->SizePercent = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TPyramidForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TPyramidForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

