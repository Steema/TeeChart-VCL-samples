//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Shape_VertAlign.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TShapeVertAlign *ShapeVertAlign;
//---------------------------------------------------------------------------
__fastcall TShapeVertAlign::TShapeVertAlign(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TShapeVertAlign::RadioGroup1Click(TObject *Sender)
{
  AnsiString St;

  TTeeVertAlign Align = vaTop;

  switch (RadioGroup1->ItemIndex)
  {
    case 0: { Align = vaTop; St ="Text at Top";} break;
    case 1: { Align = vaCenter; St = "Text at Center"; } break;
    case 2: { Align = vaBottom; St = "Text at Bottom";} break;
  }

  Series1->VertAlign = Align; Series1->Text->Text = St;
  Series2->VertAlign = Align; Series2->Text->Text = St;
  Series3->VertAlign = Align; Series3->Text->Text = St;

}
//---------------------------------------------------------------------------

