//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Vector3D.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TVector3DSeriesForm *Vector3DSeriesForm;
//---------------------------------------------------------------------------
__fastcall TVector3DSeriesForm::TVector3DSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TVector3DSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(25);
  Series1->UsePalette = true;

  ButtonPen1->LinkPen(Series1->Pen);
}
//---------------------------------------------------------------------------

