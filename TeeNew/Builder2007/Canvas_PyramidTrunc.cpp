//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_PyramidTrunc.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma resource "*.dfm"
TTruncPyramidForm *TruncPyramidForm;
//---------------------------------------------------------------------------
__fastcall TTruncPyramidForm::TTruncPyramidForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTruncPyramidForm::Chart1AfterDraw(TObject *Sender)
{
  TRect R;
  R.Left = Chart1->ChartXCenter;
  R.Top = Chart1->ChartYCenter;
  R.Right = R.Left+60;
  R.Bottom = R.Top+70;
  TCanvas3D *tmpCanvas = Chart1->Canvas;
  tmpCanvas->Brush->Color = clMoneyGreen;
  tmpCanvas->PyramidTrunc(R,0,50,ScrollBar1->Position,ScrollBar2->Position);
}
//---------------------------------------------------------------------------

void __fastcall TTruncPyramidForm::ScrollBar1Change(TObject *Sender)
{
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

