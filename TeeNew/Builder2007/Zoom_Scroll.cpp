//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Zoom_Scroll.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TZoomScrollForm *ZoomScrollForm;
//---------------------------------------------------------------------------
__fastcall TZoomScrollForm::TZoomScrollForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TZoomScrollForm::Button1Click(TObject *Sender)
{
  Chart1->ZoomPercent(110);  // 110 % = zoom in 10%
}
//---------------------------------------------------------------------------

void __fastcall TZoomScrollForm::Button2Click(TObject *Sender)
{
  Chart1->BottomAxis->Scroll(2,false);
}
//---------------------------------------------------------------------------

void __fastcall TZoomScrollForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(50);
}
//---------------------------------------------------------------------------

