//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "WaterFall_Series.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TWaterFallForm *WaterFallForm;
//---------------------------------------------------------------------------
__fastcall TWaterFallForm::TWaterFallForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TWaterFallForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  ButtonPen1->LinkPen(Series1->Pen);
  ButtonPen2->LinkPen(Series1->WaterLines);
}
//---------------------------------------------------------------------------

void __fastcall TWaterFallForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

