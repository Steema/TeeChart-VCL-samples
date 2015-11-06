//---------------------------------------------------------------------------

#include <vcl.h>
#include <Series.hpp>
#pragma hdrstop

#include "Series_Groups.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma resource "*.dfm"
TSeriesGroupsForm *SeriesGroupsForm;
//---------------------------------------------------------------------------
__fastcall TSeriesGroupsForm::TSeriesGroupsForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeriesGroupsForm::FormCreate(TObject *Sender)
{
  TChartSeries *line;
  // Create some Line series, and fill them with random values...
  for (int t=0; t<10; t++)
  {
    line = Chart1->AddSeries(__classid(TLineSeries));
    line->Title = "Line "+IntToStr(t);
    line->FillSampleValues();
  }

  // Create two "Series Groups", and add some series to each group...

  Group1 = Chart1->SeriesList->AddGroup("First group");
  Group1->Add( Chart1->Series[0] );
  Group1->Add( Chart1->Series[2] );
  Group1->Add( Chart1->Series[4] );
  Group1->Add( Chart1->Series[6] );
  Group1->Add( Chart1->Series[8] );

  Group2 = Chart1->SeriesList->AddGroup("Second group");
  Group2->Add( Chart1->Series[1] );
  Group2->Add( Chart1->Series[3] );
  Group2->Add( Chart1->Series[5] );
  Group2->Add( Chart1->Series[7] );
  Group2->Add( Chart1->Series[9] );

  // Show all series in first group
  Chart1->SeriesList->Groups->Items[0]->Show();

  // Hide all series in second group
  Chart1->SeriesList->Groups->Items[1]->Hide();

  // Tell the Chart ListBox to show the Group1 only...
  ChartListBox1->SeriesGroup = Group1;

  // Add all groups to combo-box for selection...

  ComboFlat1->Clear();

  TSeriesGroups *groups = Chart1->SeriesList->Groups;
  for (int t=0; t<groups->Count; t++)
    ComboFlat1->Items->AddObject(groups->Items[t]->Name,groups->Items[t]);
  ComboFlat1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TSeriesGroupsForm::Button1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
     ChartEditor1->Options = ChartEditor1->Options + ChartEditor1->Options <<ceGroups;
  else
     ChartEditor1->Options = ChartEditor1->Options - ChartEditor1->Options <<ceGroups;

  if (CheckBox2->Checked)
     ChartEditor1->Options = ChartEditor1->Options + ChartEditor1->Options <<ceGroupAll;
  else
     ChartEditor1->Options = ChartEditor1->Options - ChartEditor1->Options <<ceGroupAll;

  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TSeriesGroupsForm::ComboFlat1Change(TObject *Sender)
{
  // Hide series in current group
  ChartListBox1->SeriesGroup->Hide();

  // Change series group to show at listbox...
  ChartListBox1->SeriesGroup = dynamic_cast<TSeriesGroup*>(ComboFlat1->Items->Objects[ComboFlat1->ItemIndex]);

  // Show series in newly selected group
  ChartListBox1->SeriesGroup->Show();
}
//---------------------------------------------------------------------------

