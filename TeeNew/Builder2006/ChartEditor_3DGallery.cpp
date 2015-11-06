//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartEditor_3DGallery.h"
#include <TeeEdi3D.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TGallery3DForm *Gallery3DForm;
//---------------------------------------------------------------------------
__fastcall TGallery3DForm::TGallery3DForm(TComponent* Owner)
  : TBaseForm(Owner)
{

  Series1->FillSampleValues();

  TWindowsXPTheme *theme = new TWindowsXPTheme(Chart1);
  try
  {
    theme->Apply();
  }
  __finally
  {
    delete theme;
  }

  Chart1->Walls->Left->AutoHide = true;
  Chart1->Walls->Right->AutoHide = true;

  Chart1->Walls->Left->Show();
  Chart1->Walls->Right->Show();

}
//---------------------------------------------------------------------------
void __fastcall TGallery3DForm::Button1Click(TObject *Sender)
{
  TFormTee3D *gallery3D = new TFormTee3D(this);
  try
  {
    gallery3D->ThePanel = Chart1;

    // Show 3D Gallery:
    gallery3D->Align = alNone;
    gallery3D->BorderStyle = TeeBorderStyle;  // bsDialog
    gallery3D->Position = poScreenCenter;
    gallery3D->PageControl1->ActivePage = gallery3D->TabViews;
    gallery3D->PageControl1Change(gallery3D->PageControl1);
    gallery3D->ResetTab3D = false;
    gallery3D->ShowModal();
  }
  __finally
  {
    delete gallery3D;
  }
}
//---------------------------------------------------------------------------

