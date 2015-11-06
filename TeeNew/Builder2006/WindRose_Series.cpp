//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "WindRose_Series.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma link "TeeRose"
#pragma resource "*.dfm"
TWindRoseForm *WindRoseForm;
//---------------------------------------------------------------------------
__fastcall TWindRoseForm::TWindRoseForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TWindRoseForm::CheckBox1Click(TObject *Sender)
{
  Chart1->AxisVisible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TWindRoseForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TWindRoseForm::FormCreate(TObject *Sender)
{
  Series1->Clear();
  Series1->AddXY(  30, 100, "", clTeeColor );
  Series1->AddXY(  60, 200, "", clTeeColor );
  Series1->AddXY(  90,  50, "", clTeeColor );
  Series1->AddXY( 120, 150, "", clTeeColor );

  Series2->Clear();
  Series2->AddXY( 130, 100, "", clTeeColor );
  Series2->AddXY( 160, 200, "", clTeeColor );
  Series2->AddXY( 190,  50, "", clTeeColor );
  Series2->AddXY( 220, 150, "", clTeeColor );
}
//---------------------------------------------------------------------------

void __fastcall TWindRoseForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->AngleIncrement = 15; break;
    case 1: Series1->AngleIncrement = 30; break;
    case 2: Series1->AngleIncrement = 45; break;
    case 3: Series1->AngleIncrement = 90; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TWindRoseForm::CheckBox2Click(TObject *Sender)
{
  Series1->Circled = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TWindRoseForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 1;
}
//---------------------------------------------------------------------------

