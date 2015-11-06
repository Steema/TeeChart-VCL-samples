//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Bar3D.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "Bar3D"
#pragma resource "*.dfm"
TBar3DForm *Bar3DForm;
//---------------------------------------------------------------------------
__fastcall TBar3DForm::TBar3DForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBar3DForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
   case 0: Series1->BarStyle = bsRectangle; break;
   case 1: Series1->BarStyle = bsPyramid; break;
   case 2: Series1->BarStyle = bsInvPyramid; break;
   case 3: Series1->BarStyle = bsCylinder; break;
   case 4: Series1->BarStyle = bsEllipse; break;
   case 5: Series1->BarStyle = bsArrow; break;
   case 6: Series1->BarStyle = bsRectGradient; break;
   case 7: Series1->BarStyle = bsCone; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TBar3DForm::FormCreate(TObject *Sender)
{
  Series1->Clear();
  Series1->AddBar( 0, 250, 200, "A", clRed );
  Series1->AddBar( 1,  10, 200, "B", clGreen );
  Series1->AddBar( 2,  90, 100, "C", clYellow );
  Series1->AddBar( 3,  30,  50, "D", clBlue );
  Series1->AddBar( 4,  70, 150, "E", clWhite );
  Series1->AddBar( 5, 120, 150, "F", clSilver );
}
//---------------------------------------------------------------------------

void __fastcall TBar3DForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TBar3DForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 6;
}
//---------------------------------------------------------------------------

