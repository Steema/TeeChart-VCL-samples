//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TriSurface_Series.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeSurfa"
#pragma link "TeeTriSurface"
#pragma resource "*.dfm"
TTriSurfaceForm *TriSurfaceForm;
//---------------------------------------------------------------------------
__fastcall TTriSurfaceForm::TTriSurfaceForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTriSurfaceForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(30);
  ButtonPen1->LinkPen(Series1->Border);
  ButtonPen2->LinkPen(Series1->Pen);
}
//---------------------------------------------------------------------------

