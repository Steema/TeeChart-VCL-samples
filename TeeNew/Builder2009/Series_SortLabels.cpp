//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_SortLabels.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TSeriesSortLabel *SeriesSortLabel;
//---------------------------------------------------------------------------
__fastcall TSeriesSortLabel::TSeriesSortLabel(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeriesSortLabel::FormCreate(TObject *Sender)
{
  Series1->Add( 323, "John" );
  Series1->Add( 222, "Anne" );
  Series1->Add( 456, "Matt" );
  Series1->Add( 188, "Sean" );
  Series1->Add( 701, "Andrew" );
  Series1->Add( 411, "Marc" );
}
//---------------------------------------------------------------------------

void __fastcall TSeriesSortLabel::ComboFlat1Change(TObject *Sender)
{
  if (ComboFlat1->ItemIndex == 0)
  {
    Series1->SortByLabels(loAscending);
    Label2->Caption = "Data is sorted by text (ascending)";
  }
  else
  {
    Series1->SortByLabels(loDescending);
    Label2->Caption = "Data is sorted by text (descending)";
  }
}
//---------------------------------------------------------------------------

