//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Bubble3D.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeOpenGL"
#pragma link "TeePoin3"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TBubble3DSeriesForm *Bubble3DSeriesForm;
//---------------------------------------------------------------------------
__fastcall TBubble3DSeriesForm::TBubble3DSeriesForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBubble3DSeriesForm::FormCreate(TObject *Sender)
{
  Series1->Clear();
  for (int t=1; t<=10; t++)
    Series1->AddBubble(random(100),random(100),random(100),random(100));
}
//---------------------------------------------------------------------------

