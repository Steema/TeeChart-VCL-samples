//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Editor_Color.h"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TEditorColor *EditorColor;
//---------------------------------------------------------------------------
__fastcall TEditorColor::TEditorColor(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEditorColor::Button1Click(TObject *Sender)
{
  Chart1->Color = EditColor(this,Chart1->Color);
}
//---------------------------------------------------------------------------

void __fastcall TEditorColor::FormCreate(TObject *Sender)
{
  // create custom colors if not yet created
  if (TeeCustomEditColors == NULL)
  {
     TeeCustomEditColors = new TStringList();
     // add two custom colors
     TeeCustomEditColors->Add("ColorA=D5C4AC");
     TeeCustomEditColors->Add("ColorB=A7DAC8");
  }
}
//---------------------------------------------------------------------------

