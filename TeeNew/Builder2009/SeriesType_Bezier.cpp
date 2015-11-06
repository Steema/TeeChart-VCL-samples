//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Bezier.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeBezie"
#pragma resource "*.dfm"
TBezierSeriesForm *BezierSeriesForm;
//---------------------------------------------------------------------------
__fastcall TBezierSeriesForm::TBezierSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBezierSeriesForm::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TBezierSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(30);
}
//---------------------------------------------------------------------------

void __fastcall TBezierSeriesForm::Edit1Change(TObject *Sender)
{
  Series1->NumBezierPoints = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TBezierSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TBezierSeriesForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->BezierStyle = bsWindows; break;
    case 1: Series1->BezierStyle = bsBezier3; break;
    case 2: Series1->BezierStyle = bsBezier4; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TBezierSeriesForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

