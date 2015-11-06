//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorGrid_Bitmap.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeOpenGL"
#pragma link "TeePenDlg"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TColorGridBitmap *ColorGridBitmap;
//---------------------------------------------------------------------------
__fastcall TColorGridBitmap::TColorGridBitmap(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
// set "flower" bitmap to color grid series...
void __fastcall TColorGridBitmap::SetFlower(void)
{
  Graphics::TBitmap *tmp = new Graphics::TBitmap();
  try
  {
    tmp->Assign(Image1->Picture->Graphic);
    Series1->Bitmap = tmp;
  }
  __finally
  {
    delete tmp;
  }
}
//---------------------------------------------------------------------------
void __fastcall TColorGridBitmap::FormCreate(TObject *Sender)
{
  ComboFlat1->ItemIndex = 0;
  SetFlower();
  ButtonPen1->LinkPen(Series1->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TColorGridBitmap::Button1Click(TObject *Sender)
{
  Chart1->ZoomPercent(105);
}
//---------------------------------------------------------------------------

void __fastcall TColorGridBitmap::Button2Click(TObject *Sender)
{
  Chart1->ZoomPercent(95);
}
//---------------------------------------------------------------------------


void __fastcall TColorGridBitmap::ComboFlat1Change(TObject *Sender)
{
  if (ComboFlat1->ItemIndex == 0) SetFlower();
  else
  {
    // reset colors to "default" colors
    for (int t=0; t<Series1->Count(); t++)  Series1->ValueColor[t] = clTeeColor;

    if (ComboFlat1->ItemIndex ==1)
    {
      Series1->UseColorRange = true;
      Series1->UsePalette = false;
    }
    else
    {
      Series1->UseColorRange = false;
      Series1->UsePalette = true;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TColorGridBitmap::Memo1DblClick(TObject *Sender)
{
  // protection just to avoid problems if user changes Series1
  ButtonPen1->LinkPen(NULL);
  TBaseForm::Memo1DblClick(this);  // inherited
  ButtonPen1->LinkPen(Series1->Pen);
}
//---------------------------------------------------------------------------

