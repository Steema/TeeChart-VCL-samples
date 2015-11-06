//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Title_ClickEvent.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TTitleClickEvent *TitleClickEvent;
//---------------------------------------------------------------------------
__fastcall TTitleClickEvent::TTitleClickEvent(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTitleClickEvent::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TTitleClickEvent::Chart1ClickTitle(TCustomChart *Sender,
      TChartTitle *ATitle, TMouseButton Button, TShiftState Shift, int X,
      int Y)
{
  Panel1->Caption = ATitle->Text->Text;
}
//---------------------------------------------------------------------------

void __fastcall TTitleClickEvent::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  TChartClickedPart P;
  Chart1->CalcClickedPart(Point(X,Y),P);

  switch (P.Part) {
    case cpTitle    :
    case cpFoot     :
    case cpSubTitle :
    case cpSubFoot  : Chart1->Cursor = crHandPoint;
         break;
    default : Chart1->Cursor = crDefault;
  }

  Chart1->OriginalCursor = Chart1->Cursor;
}
//---------------------------------------------------------------------------

