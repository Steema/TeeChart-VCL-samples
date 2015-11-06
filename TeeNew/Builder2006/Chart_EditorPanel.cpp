//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_EditorPanel.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TChartEditorPanelForm *ChartEditorPanelForm;
//---------------------------------------------------------------------------
__fastcall TChartEditorPanelForm::TChartEditorPanelForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartEditorPanelForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorPanelForm::ComboBox1Change(TObject *Sender)
{
  TPageControl *page = ChartEditorPanel1->Editor->MainPage;

  switch (ComboBox1->ItemIndex)
  {
    case 0: page->TabPosition = tpTop;
    case 1: { page->Style = tsTabs; page->TabPosition = tpBottom;} break;
    case 2: { page->Style = tsTabs; page->TabPosition = tpLeft;} break;
    case 3: { page->Style = tsTabs; page->TabPosition = tpRight;} break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorPanelForm::ComboBox2Change(TObject *Sender)
{
  TPageControl *page = ChartEditorPanel1->Editor->MainPage;

  switch (ComboBox1->ItemIndex)
  {
    case 0: page->Style = tsTabs;
    case 1: { page->Style = tsButtons; page->TabPosition = tpTop;} break;
    case 2: { page->Style = tsFlatButtons; page->TabPosition = tpTop;} break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorPanelForm::Chart1MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  // On mouse down, show the appropiate tab in the editor...
  ChartEditorPanel1->SelectUnderMouse();
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorPanelForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
  ComboBox2->ItemIndex = 0;
}
//---------------------------------------------------------------------------

