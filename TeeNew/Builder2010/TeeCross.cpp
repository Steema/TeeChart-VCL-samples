//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TeeCross.h"

//---------------------------------------------------------------------------
TChartSeries* LocateSeries(const AnsiString ATitle, TChartSeries *ASeries)
{
  TChart *c = dynamic_cast<TChart*>(ASeries->ParentChart);
  for (int t=0; t< c->SeriesCount(); t++)
    if (c->Series[t]->Title == ATitle) return c->Series[t];
  return NULL;
}
//---------------------------------------------------------------------------
int LocateLabel(TChartSeries *tmpSeries, const AnsiString ALabel)
{
  for (int t=0; t<tmpSeries->Count();t++)
    if (tmpSeries->XLabel[t] == ALabel) return t;
  return -1;
}
//---------------------------------------------------------------------------
void FillDataSet(TDataSet *ADataSet, TChartSeries *ASeries,
                  const AnsiString AGroupField, const AnsiString ALabelField,
                  const AnsiString AValueField, TGroupFormula GroupFormula)
{
  AnsiString tmpGroup, tmpLabel;
  double tmpValue;
  int tmpPoint;
  TChartSeries *tmpSeries;

  TChart *c = dynamic_cast<TChart*>(ASeries->ParentChart);
  while (c->SeriesCount() > 1)
  {
    if (c->Series[c->SeriesCount()-1] != ASeries) delete c->Series[c->SeriesCount()-1];
  }
  ASeries->Clear();
  ASeries->Title = "";
  TBookmark tmpBookMark = ADataSet->GetBookmark();
  ADataSet->DisableControls();
  try
  {
    ADataSet->First();
    while (! ADataSet->Eof)
    {
          tmpGroup = ADataSet->FieldByName(AGroupField)->AsString;
          tmpSeries = LocateSeries(tmpGroup, ASeries);
          if (tmpSeries == NULL)
          {
            if (ASeries->Title =="") tmpSeries = ASeries;
            else
            {
              tmpSeries = CloneChartSeries(ASeries);
              tmpSeries->SeriesColor = GetDefaultColor(c->SeriesCount());
            }
            tmpSeries->Title = tmpGroup;
          }
          tmpLabel = ADataSet->FieldByName(ALabelField)->AsString;
          tmpValue = ADataSet->FieldByName(AValueField)->AsFloat;
          if (GroupFormula == gfCount) tmpValue = 1;

          tmpPoint = LocateLabel(tmpSeries,tmpLabel);
          if (tmpPoint == -1)
          {
            tmpSeries->Add(tmpValue,tmpLabel,clTeeColor);
            for (int t=0; t<c->SeriesCount(); t++)
              if (c->Series[t] != tmpSeries)
               if (tmpSeries->Count()> c->Series[t]->Count())
                 for (int tt=1; tt <= tmpSeries->Count()-c->Series[t]->Count(); tt++)
                   c->Series[t]->Add(0,tmpLabel,clTeeColor);
          }
          else
          {
            TChartValueList *l = tmpSeries->MandatoryValueList;
            switch (GroupFormula)
            {
              case gfCount: l->Value[tmpPoint] = l->Value[tmpPoint]+tmpValue; break;
              case gfSum: l->Value[tmpPoint] = l->Value[tmpPoint]+tmpValue; break;
            }
          }
          ADataSet->Next();
    }
  }
  __finally
  {
    ADataSet->GotoBookmark(tmpBookMark);
    ADataSet->FreeBookmark(tmpBookMark);
    ADataSet->EnableControls();
  }
}

#pragma package(smart_init)
