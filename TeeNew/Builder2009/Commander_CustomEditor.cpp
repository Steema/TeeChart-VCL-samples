//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Commander_CustomEditor.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma link "TeeEdit"
#pragma resource "*.dfm"
TCommanderCustomEditor *CommanderCustomEditor;
//---------------------------------------------------------------------------
__fastcall TCommanderCustomEditor::TCommanderCustomEditor(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCommanderCustomEditor::FormCreate(TObject *Sender)
{

  // This can be done at design-time.
  // This code is how to do it programatically

  TeeCommander1->Panel = Chart1;
  TeeCommander1->ChartEditor = ChartEditor1;
  TeeCommander1->Previewer = ChartPreviewer1;

  ChartEditor1->Chart = Chart1;
  ChartPreviewer1->Chart = Chart1;
}
//---------------------------------------------------------------------------


void __fastcall TCommanderCustomEditor::ChartEditor1Show(TObject *Sender)
{
  // Force "Tree" editor mode at editor OnShow event
  dynamic_cast<TChartEditForm*>(Sender)->Tree->Visible = true;
}
//---------------------------------------------------------------------------

