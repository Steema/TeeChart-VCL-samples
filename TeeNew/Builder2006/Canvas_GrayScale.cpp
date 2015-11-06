//---------------------------------------------------------------------------

#include <vcl.h>
#include <windows.h>
#pragma hdrstop

#include "Canvas_GrayScale.h"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TGrayScaleForm *GrayScaleForm;

/* This procedure will convert all pixels in ABitmap to
  levels of gray */
//---------------------------------------------------------------------------
void __fastcall TeeGrayScale(Graphics::TBitmap *ABitmap, bool Inverted)
{
  TRGBTriple *ptr;
  int tmp;
  ABitmap->PixelFormat = pf24bit;
  for (int y=ABitmap->Height-1; y>0; y--)
  {
    ptr = (TRGBTriple *)(ABitmap->ScanLine[y]);
    for (int x =0; x< ABitmap->Width;x++)
    {
      tmp = (ptr[x].rgbtBlue+ptr[x].rgbtGreen+ptr[x].rgbtRed)/3;
      if (Inverted) tmp = 255-tmp;
      ptr[x].rgbtBlue = tmp;
      ptr[x].rgbtGreen = tmp;
      ptr[x].rgbtRed = tmp;
    }
  }
}
//---------------------------------------------------------------------------
__fastcall TGrayScaleForm::TGrayScaleForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGrayScaleForm::CheckBox1Click(TObject *Sender)
{
  CheckBox2->Enabled = CheckBox1->Checked;
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TGrayScaleForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

void __fastcall TGrayScaleForm::Chart1AfterDraw(TObject *Sender)
{
  if (CheckBox1->Checked)
    TeeGrayScale(dynamic_cast<TTeeCanvas3D*>(Chart1->Canvas)->Bitmap,CheckBox2->Checked);
}
//---------------------------------------------------------------------------

