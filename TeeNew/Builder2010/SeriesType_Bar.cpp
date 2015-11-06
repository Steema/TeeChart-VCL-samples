//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Bar.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TBarSeriesForm *BarSeriesForm;
//---------------------------------------------------------------------------
__fastcall TBarSeriesForm::TBarSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarSeriesForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->MultiBar = Series::mbNone; break;
    case 1: Series1->MultiBar = Series::mbSide; break;
    case 2: Series1->MultiBar = Series::mbStacked; break;
    case 3: Series1->MultiBar = Series::mbStacked100; break;
    case 4: Series1->MultiBar = Series::mbSideAll; break;
  }

  // remove "Marks" when stacking...
  bool tmp = (Series1->MultiBar != mbStacked && Series1->MultiBar != mbStacked100);
  Series1->Marks->Visible = tmp;
  Series2->Marks->Visible = tmp;
  Series3->Marks->Visible = tmp;
}
//---------------------------------------------------------------------------

void __fastcall TBarSeriesForm::ComboBox2Change(TObject *Sender)
{
  switch (ComboBox2->ItemIndex)
  {
    case 0: Series1->BarStyle = bsRectangle; break;
    case 1: Series1->BarStyle = bsPyramid; break;
    case 2: Series1->BarStyle = bsInvPyramid; break;
    case 3: Series1->BarStyle = bsCilinder; break;
    case 4: Series1->BarStyle = bsEllipse; break;
    case 5: Series1->BarStyle = bsArrow; break;
    case 6: Series1->BarStyle = bsRectGradient; break;
    case 7: Series1->BarStyle = bsCone; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TBarSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TBarSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TBarSeriesForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
  ComboBox2->ItemIndex = 0;
}
//---------------------------------------------------------------------------

