//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "PrintPreview_Navigate.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Print_Preview"
#pragma link "TeePreviewPanel"
#pragma link "StatChar"
#pragma link "TeeNavigator"
#pragma link "TeeEdiGene"
#pragma resource "*.dfm"
TPrintPreviewNavigate *PrintPreviewNavigate;
//---------------------------------------------------------------------------
__fastcall TPrintPreviewNavigate::TPrintPreviewNavigate(TComponent* Owner)
        : TPrintPreviewForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPrintPreviewNavigate::Chart1PageChange(TObject *Sender)
{
  // after changing the current page, refresh the Print Preview
  TeePreviewPanel1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TPrintPreviewNavigate::FormShow(TObject *Sender)
{
  // after adding points to Series1 refresh the navigator buttons
  Series1->FillSampleValues(20);
  ChartPageNavigator1->EnableButtons();
}
//---------------------------------------------------------------------------

