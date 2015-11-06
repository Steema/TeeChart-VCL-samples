//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Zoom_Direction.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TZoomDirection *ZoomDirection;
//---------------------------------------------------------------------------
__fastcall TZoomDirection::TZoomDirection(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TZoomDirection::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Chart1->Zoom->Direction = tzdHorizontal; break;
    case 1: Chart1->Zoom->Direction = tzdVertical; break;
    case 2: Chart1->Zoom->Direction = tzdBoth; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TZoomDirection::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(40);
}
//---------------------------------------------------------------------------

void __fastcall TZoomDirection::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 2;
}
//---------------------------------------------------------------------------

