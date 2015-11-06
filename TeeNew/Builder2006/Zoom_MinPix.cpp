//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Zoom_MinPix.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TZoomMinPixel *ZoomMinPixel;
//---------------------------------------------------------------------------
__fastcall TZoomMinPixel::TZoomMinPixel(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TZoomMinPixel::Edit1Change(TObject *Sender)
{
  Chart1->Zoom->MinimumPixels = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TZoomMinPixel::ComboBox1Change(TObject *Sender)
{
  Chart1->Zoom->MouseButton = static_cast<TMouseButton>(ComboBox1->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TZoomMinPixel::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(80);
}
//---------------------------------------------------------------------------

void __fastcall TZoomMinPixel::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

