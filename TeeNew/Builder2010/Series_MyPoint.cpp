//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_MyPoint.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "MyPoint"
#pragma link "TeePenDlg"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TMyPointSeriesForm *MyPointSeriesForm;
//---------------------------------------------------------------------------
__fastcall TMyPointSeriesForm::TMyPointSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMyPointSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  ButtonPen1->LinkPen(Series1->LinesPen);
}
//---------------------------------------------------------------------------

void __fastcall TMyPointSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TMyPointSeriesForm::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

