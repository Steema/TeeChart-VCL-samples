//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pointer_DrawCanvas.h"
#include <TeCanvas.hpp>
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPointerDrawCanvas *PointerDrawCanvas;

//---------------------------------------------------------------------------
__fastcall TPointerDrawCanvas::TPointerDrawCanvas(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPointerDrawCanvas::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

void __fastcall TPointerDrawCanvas::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  PaintBox1->Repaint();
}
//---------------------------------------------------------------------------

class TPointerAccess : public TSeriesPointer
{
public:
        void __fastcall PrepareCanvas(Tecanvas::TCanvas3D* ACanvas, Graphics::TColor ColorValue);
};

void __fastcall TPointerAccess::PrepareCanvas(Tecanvas::TCanvas3D* ACanvas, Graphics::TColor ColorValue)
{
  if (Pen->Visible && Pen->Color == clTeeColor)
    ACanvas->AssignVisiblePenColor(Pen, ColorValue);
  else ACanvas->AssignVisiblePen(Pen);

  TColor tmp = Brush->Color;
  if (tmp == clTeeColor)
  {
    if (Brush->Style == bsSolid) tmp = ColorValue;
    else tmp = clBlack;
  }
  ACanvas->AssignBrushColor(Brush,tmp,ColorValue);
}
//---------------------------------------------------------------------------
void __fastcall TPointerDrawCanvas::PaintBox1Paint(TObject *Sender)
{

  TPoint P = Chart1->GetCursorPos();
  int tmp = Series1->Clicked(P.x, P.y);
  if (tmp != -1)
  {
    TColor AColor = Series1->ValueColor[tmp];
    TRect R = PaintBox1->ClientRect;
    int XPos = (R.Left + R.Right ) /2;
    int YPos = (R.Top + R.Bottom ) /2;
    TTeeCanvas3D *ACanvas = new TTeeCanvas3D;
    try
    {
      ACanvas->ReferenceCanvas = PaintBox1->Canvas;
      TPointerAccess *tmpPointer =static_cast<TPointerAccess*>(Series1->Pointer);
      tmpPointer->PrepareCanvas(ACanvas,AColor);
      tmpPointer->DrawPointer(ACanvas,Chart1->View3D,XPos,YPos,
                    tmpPointer->HorizSize,tmpPointer->VertSize, AColor,Series1->Pointer->Style);
      }
    __finally
    {
      delete ACanvas;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TPointerDrawCanvas::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TPointerDrawCanvas::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

