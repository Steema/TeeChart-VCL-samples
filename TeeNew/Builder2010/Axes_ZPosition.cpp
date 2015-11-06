//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axes_ZPosition.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxesZPosition *AxesZPosition;
//---------------------------------------------------------------------------
__fastcall TAxesZPosition::TAxesZPosition(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxesZPosition::ScrollBar1Change(TObject *Sender)
{
  // change both the axis Z position and the Grid ending Z position too.

  if (ComboBox1->ItemIndex == 0)
  {
    Chart1->Axes->Left->ZPosition = ScrollBar1->Position;
    Chart1->Axes->Left->Grid->ZPosition = ScrollBar1->Position;
  }
  else
  {
    Chart1->Axes->Right->ZPosition = ScrollBar1->Position;
    Chart1->Axes->Right->Grid->ZPosition = ScrollBar1->Position;
  }

  Label2->Caption = IntToStr(ScrollBar1->Position)+" %";
}
//---------------------------------------------------------------------------

void __fastcall TAxesZPosition::FormCreate(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TAxesZPosition::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex ==0) ScrollBar1->Position = (int)Chart1->Axes->Left->ZPosition;
  else ScrollBar1->Position = (int)Chart1->Axes->Right->ZPosition;

}
//---------------------------------------------------------------------------

