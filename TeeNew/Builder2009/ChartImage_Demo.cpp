//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartImage_Demo.h"
#include "Series.hpp"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeEditPro"
#pragma resource "*.dfm"
TChartImageForm *ChartImageForm;
//---------------------------------------------------------------------------
__fastcall TChartImageForm::TChartImageForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartImageForm::CheckBox1Click(TObject *Sender)
{
  Image1->Stretch = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartImageForm::Button1Click(TObject *Sender)
{
  TChartImage *tmp = dynamic_cast<TChartImage*>(Image1->Picture->Graphic);
  EditChart(this,tmp->Chart);
}
//---------------------------------------------------------------------------

void __fastcall TChartImageForm::FormShow(TObject *Sender)
{
  // Example:
  // Access the internal chart and fill sample values:

  TChartImage *tmp = dynamic_cast<TChartImage*>(Image1->Picture->Graphic);

  tmp->Chart->AddSeries(new TLineSeries(this));
  tmp->Chart->Series[0]->FillSampleValues(5);
}
//---------------------------------------------------------------------------

