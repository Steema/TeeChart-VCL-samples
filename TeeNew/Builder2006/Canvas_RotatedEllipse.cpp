//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_RotatedEllipse.h"
#include "TeCanvas.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TCanvasRotatedEllipse *CanvasRotatedEllipse;
//---------------------------------------------------------------------------
__fastcall TCanvasRotatedEllipse::TCanvasRotatedEllipse(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCanvasRotatedEllipse::Chart1AfterDraw(TObject *Sender)
{

  TCanvas3D *c = Chart1->Canvas;
  c->RotatedEllipse(50,90,250,160,0,ScrollBar1->Position);
  TPoint p[5] = {Point(300,200),
                Point(350,190),
                Point(380,210),
                Point(320,90),
                Point(290,180)};
  c->Polyline(p,5,0);
}
//---------------------------------------------------------------------------

void __fastcall TCanvasRotatedEllipse::ScrollBar1Change(TObject *Sender)
{
  Label2->Caption = IntToStr(ScrollBar1->Position);
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TCanvasRotatedEllipse::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

