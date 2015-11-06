//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Wall_AutoHide.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TWallAutoHide *WallAutoHide;
//---------------------------------------------------------------------------
__fastcall TWallAutoHide::TWallAutoHide(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TWallAutoHide::FormCreate(TObject *Sender)
{
  // Set all walls "Size" property at once:
  Chart1->Walls->Size = 5;

  // Show Right wall
  Chart1->Walls->Right->Visible = true;
  Chart1->Walls->Right->AutoHide = true;

  Chart1->Walls->Left->AutoHide = true;
  Chart1->Walls->Back->AutoHide = true;
  Chart1->Walls->Back->Transparent = false;

  Color = clWhite;
}
//---------------------------------------------------------------------------

void __fastcall TWallAutoHide::ScrollBar1Change(TObject *Sender)
{
  Chart1->View3DOptions->Rotation = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TWallAutoHide::CheckBox1Click(TObject *Sender)
{
  Chart1->Walls->Left->AutoHide = CheckBox1->Checked;
  Chart1->Walls->Right->AutoHide = CheckBox1->Checked;
  Chart1->Walls->Back->AutoHide = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

