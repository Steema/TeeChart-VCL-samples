//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartEditor_Runtime.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma resource "*.dfm"
TChartEditorRuntime *ChartEditorRuntime;
//---------------------------------------------------------------------------
__fastcall TChartEditorRuntime::TChartEditorRuntime(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartEditorRuntime::Button1Click(TObject *Sender)
{
  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorRuntime::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

