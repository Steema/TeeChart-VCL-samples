//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "ColorRange_Bug.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TColorRangeBug *ColorRangeBug;
//---------------------------------------------------------------------------
__fastcall TColorRangeBug::TColorRangeBug(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorRangeBug::Button1Click(TObject *Sender)
{
  Series1->ColorRange( Series1->YValues, 100, 200, clYellow );
  Series1->ColorRange( Series1->YValues, 300, 400, clBlue );
}
//---------------------------------------------------------------------------

void __fastcall TColorRangeBug::FormCreate(TObject *Sender)
{
  // fill series with points and null points
  for (int t=1; t< 20; t++) Series1->Add( 100+random(200),"",clTeeColor);
  Series1->AddNull("");
  Series1->AddNull("");
  Series1->AddNull("");
  for (int t=1; t< 20; t++) Series1->Add( 300+random(200),"",clTeeColor);
  Series1->AddNull("");
  Series1->AddNull("");
  Series1->AddNull("");
  for (int t=1; t< 20; t++) Series1->Add( 100+random(200),"",clTeeColor);
}
//---------------------------------------------------------------------------

