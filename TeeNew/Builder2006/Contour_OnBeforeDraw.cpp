//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Contour_OnBeforeDraw.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TContourOnBefore *ContourOnBefore;
//---------------------------------------------------------------------------
__fastcall TContourOnBefore::TContourOnBefore(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TContourOnBefore::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TContourOnBefore::Series1BeforeDrawLevel(
      TContourSeries *Sender, int LevelIndex)
{
  // Change pen for selected contour level...
  if (LevelIndex==UpDown1->Position) Chart1->Canvas->Pen->Width = 3;
  else Chart1->Canvas->Pen->Width = 1;
}
//---------------------------------------------------------------------------

void __fastcall TContourOnBefore::Edit1Change(TObject *Sender)
{
  Series1->Repaint();
}
//---------------------------------------------------------------------------

