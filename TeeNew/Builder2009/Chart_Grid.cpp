//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_Grid.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeChartGrid"
#pragma link "TeeNavigator"
#pragma resource "*.dfm"
TChartGridForm *ChartGridForm;
//---------------------------------------------------------------------------
__fastcall TChartGridForm::TChartGridForm(TComponent* Owner)
        : TBaseForm(Owner)
{

}
//---------------------------------------------------------------------------
void __fastcall TChartGridForm::FormCreate(TObject *Sender)
{
  ButtonColor1->LinkProperty(Series1,"SeriesColor");
  // fill series
  Series1->Add( 32,"John",clTeeColor);
  Series1->Add(417,"Anne",clTeeColor);
  Series1->Add( 65,"Louise",clTeeColor);
  Series1->Add( 87,"Jeff",clTeeColor);

  // after adding points, we should notify the grid...
  ChartGrid1->RecalcDimensions();
}
//---------------------------------------------------------------------------

void __fastcall TChartGridForm::CheckBox1Click(TObject *Sender)
{
  ChartGrid1->ShowLabels = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TChartGridForm::CheckBox2Click(TObject *Sender)
{
  if (CheckBox2->Checked) ChartGrid1->Options = ChartGrid1->Options - TGridOptions()<<goEditing;
  else ChartGrid1->Options = ChartGrid1->Options + TGridOptions()<<goEditing;

  // repaint navigator, disabling/enabling buttons
  ChartGridNavigator1->EnableButtons();
}
//---------------------------------------------------------------------------

