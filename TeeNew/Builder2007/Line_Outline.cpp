//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Line_Outline.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TLineOutline *LineOutline;
//---------------------------------------------------------------------------
__fastcall TLineOutline::TLineOutline(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLineOutline::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(25);

  ButtonPen1->LinkPen(Series1->LinePen);
  ButtonPen2->LinkPen(Series1->OutLine);

}
//---------------------------------------------------------------------------

