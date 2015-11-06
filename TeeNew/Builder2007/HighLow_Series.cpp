//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "HighLow_Series.h"
#include <TeeBrushDlg.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "ErrorBar"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
THighLowForm *HighLowForm;
//---------------------------------------------------------------------------
__fastcall THighLowForm::THighLowForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THighLowForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  ButtonPen1->LinkPen(Series1->HighPen);
  ButtonPen2->LinkPen(Series1->LowPen);
  ButtonPen3->LinkPen(Series1->Pen);
}
//---------------------------------------------------------------------------

void __fastcall THighLowForm::Button1Click(TObject *Sender)
{
  EditChartBrush(this,Series1->HighBrush);
}
//---------------------------------------------------------------------------

void __fastcall THighLowForm::Button2Click(TObject *Sender)
{
  EditChartBrush(this,Series1->LowBrush);
}
//---------------------------------------------------------------------------

