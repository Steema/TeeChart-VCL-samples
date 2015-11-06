//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_AntiAlias.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TCanvasAntiAlias *CanvasAntiAlias;
//---------------------------------------------------------------------------
__fastcall TCanvasAntiAlias::TCanvasAntiAlias(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCanvasAntiAlias::CheckBox1Click(TObject *Sender)
{
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TCanvasAntiAlias::Chart1AfterDraw(TObject *Sender)
{
  if (CheckBox1->Checked && !InsideAntiAliasing)
  {
    InsideAntiAliasing = true;  // set flag to avoid re-entrancy
    Graphics::TBitmap *b = TeeAntiAlias(Chart1);  // create anti-aliased bitmap
    try
    {
      Chart1->Canvas->Draw(0,0,b);  // draw bitmap onto Chart1
    }
     __finally
    {
      delete b;  // delete temporary bitmap
      InsideAntiAliasing = false;  // reset flag
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TCanvasAntiAlias::Edit1Change(TObject *Sender)
{
  if (Showing)
  {
    Chart1->Canvas->FontZoom = UpDown1->Position;
    Chart1->Invalidate();
  }
}
//---------------------------------------------------------------------------


