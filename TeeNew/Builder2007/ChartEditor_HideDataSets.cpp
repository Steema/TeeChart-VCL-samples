//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartEditor_HideDataSets.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TChartEditorHideDataSets *ChartEditorHideDataSets;
//---------------------------------------------------------------------------
__fastcall TChartEditorHideDataSets::TChartEditorHideDataSets(TComponent* Owner)
  : TForm(Owner)
{
}
// TMYChart class implementation
__fastcall TMyChart::TMyChart(TComponent *Owner)
  : TDBChart(Owner)
{

}
//---------------------------------------------------------------------------
// This function should return TRUE when AComponent is a valid
// source for ASeries.
// Returning FALSE will not add AComponent at Chart Editor dialog.
//
// It can be useful to return FALSE to hide tables or datasets from
// Series DataSource dialog.
//
bool __fastcall TMyChart::IsValidDataSource(TChartSeries *ASeries,
TComponent *AComponent)
{
  bool res = TDBChart::IsValidDataSource(ASeries,AComponent); // inherited
  if (res && HideTable != NULL) res = AComponent!=HideTable;
  return res;
}

void __fastcall TChartEditorHideDataSets::FormCreate(TObject *Sender)
{
  // Create "MyChart"
  MyChart = new TMyChart(this);
  MyChart->Parent = this;
  MyChart->Align = alClient;

  // Add one Bar series
  MyChart->AddSeries(new TBarSeries(this));
  MyChart->Series[0]->DataSource = Table2;

  // Tell "MyChart" to hide Table1 dataset
  MyChart->HideTable = Table1;
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorHideDataSets::CheckBox1Click(TObject *Sender)
{
  // just an example of using "MyChart" to specify hidden components at editor
  if (CheckBox1->Checked) MyChart->HideTable = Table1;
  else MyChart->HideTable = NULL;
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorHideDataSets::Button1Click(TObject *Sender)
{
  // Show chart editor dialog, positioned at series datasource tab
  // for the first MyChart series
  EditSeriesDataSource(this,MyChart->Series[0]);
}
//---------------------------------------------------------------------------

