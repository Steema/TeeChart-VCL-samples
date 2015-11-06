//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Commander_Editor.h"
#include "TeeCommanderEditor.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma resource "*.dfm"
TCommanderEditorExample *CommanderEditorExample;
//---------------------------------------------------------------------------
__fastcall TCommanderEditorExample::TCommanderEditorExample(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCommanderEditorExample::Button1Click(TObject *Sender)
{
  TeeCommanderEdit(this,TeeCommander1);  
}
//---------------------------------------------------------------------------

