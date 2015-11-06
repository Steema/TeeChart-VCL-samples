//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Gallery_Alternate.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TGalleryAlternate *GalleryAlternate;
//---------------------------------------------------------------------------
__fastcall TGalleryAlternate::TGalleryAlternate(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGalleryAlternate::FormShow(TObject *Sender)
{
  Gallery = new TTeeGalleryForm(this);
  Gallery->Align = alClient;
  AddFormTo(Gallery,this,0);
}
//---------------------------------------------------------------------------
void __fastcall TGalleryAlternate::FormDestroy(TObject *Sender)
{
  delete Gallery;  
}
//---------------------------------------------------------------------------
