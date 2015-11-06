//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartEditor_Dialog.h"
#include <TeeEditCha.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma resource "*.dfm"
TChartEditorForm *ChartEditorForm;
//---------------------------------------------------------------------------
__fastcall TChartEditorForm::TChartEditorForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartEditorForm::Button1Click(TObject *Sender)
{
  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorForm::CheckBox1Click(TObject *Sender)
{
  TChartEditorHiddenTabs NewTabs = TChartEditorHiddenTabs()<< cetTools <<cetExport <<cetPrintPreview <<cetSeriesData;
  if (CheckBox1->Checked) ChartEditor1->HideTabs -= NewTabs;
  else ChartEditor1->HideTabs += NewTabs;
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

