//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorBand_Clicked.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TColorBandClicked *ColorBandClicked;
//---------------------------------------------------------------------------
__fastcall TColorBandClicked::TColorBandClicked(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorBandClicked::ChartTool1Click(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  Label1->Caption = "Clicked at X:"+IntToStr(X)+" Y:"+IntToStr(Y);

  ChartTool1->Color = TColor(RGB(random(255),random(255),random(255)));

}
//---------------------------------------------------------------------------

void __fastcall TColorBandClicked::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  if (ChartTool1->Clicked(X,Y)) Chart1->Cursor = crHandPoint;
  else Chart1->Cursor = crDefault;

  Chart1->OriginalCursor = Chart1->Cursor;
}
//---------------------------------------------------------------------------

