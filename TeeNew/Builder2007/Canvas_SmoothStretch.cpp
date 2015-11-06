//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_SmoothStretch.h"
#include "TeCanvas.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TCanvasSmoothStretch *CanvasSmoothStretch;
//---------------------------------------------------------------------------
__fastcall TCanvasSmoothStretch::TCanvasSmoothStretch(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCanvasSmoothStretch::RadioGroup1Click(TObject *Sender)
{
  Graphics::TBitmap *B = new Graphics::TBitmap();
  try
  {
    B->Width = Image2->Width;
    B->Height = Image2->Height;
    if (RadioGroup1->ItemIndex==0) SmoothStretch(Image1->Picture->Bitmap, B);  // smooth
    else B->Canvas->StretchDraw(Rect(0,0,B->Width,B->Height),Image1->Picture->Bitmap); // normal

    Image2->Picture->Assign(B);
  }
  __finally
  {
    delete B;
  }
}
//---------------------------------------------------------------------------

void __fastcall TCanvasSmoothStretch::FormCreate(TObject *Sender)
{
  // Draw a chart onto Image1 for this example:
  Chart1->Legend->Visible = false;
  Chart1->Width = Image1->Width;
  Chart1->Height = Image1->Height;
  Image1->Picture->Assign(Chart1);

  RadioGroup1Click(this);
}
//---------------------------------------------------------------------------

