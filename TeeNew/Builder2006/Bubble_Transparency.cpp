//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bubble_Transparency.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeOpenGL"
#pragma resource "*.dfm"
TBubbleTransparency *BubbleTransparency;
//---------------------------------------------------------------------------
__fastcall TBubbleTransparency::TBubbleTransparency(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBubbleTransparency::ScrollBar1Change(TObject *Sender)
{
  Series1->Transparency = ScrollBar1->Position;
  Label2->Caption = IntToStr(Series1->Transparency);
}
//---------------------------------------------------------------------------

void __fastcall TBubbleTransparency::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);

  // cosmetic gradient:
  Series1->Pointer->Gradient->Visible = true;
  Series1->Pointer->Gradient->Direction = gdRadial;

  // transparency:
  Series1->Transparency = 50;

  // Now, let's adjust horizontal axis to fit all bubbles...

  // 1) force chart redrawing
  Chart1->Draw();

  // 2) fit
  double tmp = Series1->GetVertAxis->CalcSizeValue(Series1->RadiusValues->First());
  Series1->GetHorizAxis->MinimumOffset = tmp;

  tmp = Series1->GetVertAxis->CalcSizeValue(Series1->RadiusValues->Last());
  Series1->GetHorizAxis->MaximumOffset = tmp;
}
//---------------------------------------------------------------------------

