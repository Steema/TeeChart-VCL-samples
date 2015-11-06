//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TeePreviewPanelEditor.hpp"
#include "Print_Preview.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePreviewPanel"
#pragma link "TeePreviewPanelEditor"
#pragma resource "*.dfm"
TPrintPreviewForm *PrintPreviewForm;
//---------------------------------------------------------------------------
__fastcall TPrintPreviewForm::TPrintPreviewForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPrintPreviewForm::Button1Click(TObject *Sender)
{
        TFormPreviewPanelEditor *PrintPrevi = new TFormPreviewPanelEditor(this,TeePreviewPanel1);
        try
        {
           PrintPrevi->ShowModal();
        }
        __finally
        {
           delete PrintPrevi;
        }
}
//---------------------------------------------------------------------------

