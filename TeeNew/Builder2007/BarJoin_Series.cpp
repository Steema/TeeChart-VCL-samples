//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BarJoin_Series.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "MyPoint"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TBarJoinForm *BarJoinForm;
//---------------------------------------------------------------------------
__fastcall TBarJoinForm::TBarJoinForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarJoinForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(3);
  ButtonPen1->LinkPen(Series1->JoinPen);
}
//---------------------------------------------------------------------------

