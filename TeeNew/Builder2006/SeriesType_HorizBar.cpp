//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_HorizBar.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
THorizBarSeriesForm *HorizBarSeriesForm;
//---------------------------------------------------------------------------
__fastcall THorizBarSeriesForm::THorizBarSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THorizBarSeriesForm::ComboBox1Change(TObject *Sender)
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
  bool tmp = (Series1->MultiBar != Series::mbStacked && Series1->MultiBar != Series::mbStacked100);
  Series1->Marks->Visible = tmp;
  Series2->Marks->Visible = tmp;
  Series3->Marks->Visible = tmp;
}
//---------------------------------------------------------------------------

void __fastcall THorizBarSeriesForm::ComboBox2Change(TObject *Sender)
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

void __fastcall THorizBarSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall THorizBarSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall THorizBarSeriesForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
  ComboBox2->ItemIndex = 0;
}
//---------------------------------------------------------------------------

