//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BoxPlot_Series.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeBoxPlot"
#pragma resource "*.dfm"
TBoxPlotForm *BoxPlotForm;
//---------------------------------------------------------------------------
__fastcall TBoxPlotForm::TBoxPlotForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TBoxPlotForm::FormCreate(TObject *Sender)
{
  double vals1[6] = {3,6,8,15,19,21};
  double vals2[6] = {0,0.5,4,4.8,9,10};
  double vals3[6] = {4,5,6,7,12,25};
  Series1->AddArray(vals1,5);
  Series2->AddArray(vals2,5);
  Series3->AddArray(vals3,5);
}
//---------------------------------------------------------------------------

void __fastcall TBoxPlotForm::CheckBox1Click(TObject *Sender)
{
  TChartSeriesClass tmp;
  if (CheckBox1->Checked) tmp = __classid(TBoxSeries);
  else tmp = __classid(THorizBoxSeries);
  ChangeAllSeriesType(Chart1,tmp);
}
//---------------------------------------------------------------------------

void __fastcall TBoxPlotForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);        
}
//---------------------------------------------------------------------------

