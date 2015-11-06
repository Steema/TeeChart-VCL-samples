//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Preview_CustomDraw.h"
#include "TeCanvas.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePreviewPanel"
#pragma resource "*.dfm"
TPreviewCustomDraw *PreviewCustomDraw;
//---------------------------------------------------------------------------
__fastcall TPreviewCustomDraw::TPreviewCustomDraw(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPreviewCustomDraw::TeePreviewPanel1AfterDraw(
      TObject *Sender)
{
  TeePreviewPanel1->Canvas->Font->Color = clRed;
  TeePreviewPanel1->Canvas->Font->Size = 12;
  TeePreviewPanel1->Canvas->TextOut(TeePreviewPanel1->PaperRect.Left+10,TeePreviewPanel1->PaperRect.Top+6,"Some text");
}
//---------------------------------------------------------------------------

