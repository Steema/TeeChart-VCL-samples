//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Point3D_BaseLine.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeePoin3"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TPoint3DBaseLine *Point3DBaseLine;
//---------------------------------------------------------------------------
__fastcall TPoint3DBaseLine::TPoint3DBaseLine(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPoint3DBaseLine::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
  Series1->BaseLine->Visible = true;
  Series1->BaseLine->Color = clNavy;

  ButtonPen1->LinkPen(Series1->BaseLine);

}
//---------------------------------------------------------------------------

