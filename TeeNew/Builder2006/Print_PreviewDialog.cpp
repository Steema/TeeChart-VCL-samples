//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Print_PreviewDialog.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma resource "*.dfm"
TPrintPreviewDialog *PrintPreviewDialog;
//---------------------------------------------------------------------------
__fastcall TPrintPreviewDialog::TPrintPreviewDialog(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPrintPreviewDialog::Button1Click(TObject *Sender)
{
  ChartPreviewer1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TPrintPreviewDialog::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

