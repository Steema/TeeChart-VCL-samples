//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartListBox_Editor.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ChartListBox_Radio"
#pragma resource "*.dfm"
TChartListBoxEditor *ChartListBoxEditor;
//---------------------------------------------------------------------------
__fastcall TChartListBoxEditor::TChartListBoxEditor(TComponent* Owner)
  : TChartListBoxRadio(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartListBoxEditor::CBEditorClick(TObject *Sender)
{
  if (CBEditor->Checked) ChartListBox1->ShowEditor();
  else ChartListBox1->HideEditor();
}
//---------------------------------------------------------------------------

