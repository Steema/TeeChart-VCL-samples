//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GridToChart_Demo.h"
#include <Series.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeDragPoint"
#pragma resource "*.dfm"
TGridToChartDemo *GridToChartDemo;
//---------------------------------------------------------------------------
__fastcall TGridToChartDemo::TGridToChartDemo(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGridToChartDemo::GridToChart(TStringGrid *Grid, TCustomChart *Chart,
TChartSeriesClass SeriesClass)
{
/*
  TChartSeries *tmp;
  Chart->FreeAllSeries(NULL);
  for (int tmpCol = Grid->ColCount-1; tmpCol>=1; tmpCol--)
  {
	tmp = Chart->AddSeries(SeriesClass);
	tmp->Title = Grid->Cells[tmpCol][0];
	tmp->Marks->Visible = false;
	tmp->Marks->Style = smsValue;
	tmp->Pen->Visible = false;
	for (int tmpRow=1; tmpRow<Grid->RowCount-1; tmpRow++)
	  tmp->Add(StrToFloat(Grid->Cells[tmpCol][tmpRow]),Grid->Cells[0][tmpRow]);
  }
*/
}

void __fastcall TGridToChartDemo::FormCreate(TObject *Sender)
{
  StringGrid1->RowCount = 13;
  StringGrid1->ColCount = 4;
  for (int t=1; t<12; t++) StringGrid1->Cells[0][t] = ShortMonthNames[t];

  StringGrid1->Cells[1][0] = "Africa";
  StringGrid1->Cells[2][0] = "America";
  StringGrid1->Cells[3][0] = "Asia";
  for (int Continent=1; Continent<4; Continent++)
    for (int Month=1; Month<12; Month++)
      StringGrid1->Cells[Continent][Month] = IntToStr(random(1000));

  // Fill chart with grid
  //GridToChart(StringGrid1,Chart1, __classid(TBarSeries));

  // Cosmetic change:
  if (Chart1->SeriesCount()>0) dynamic_cast<TBarSeries*>(Chart1->Series[0])->MultiBar = Series::mbNone;

  Chart1->Legend->Inverted = true;
}
//---------------------------------------------------------------------------

void __fastcall TGridToChartDemo::StringGrid1SetEditText(TObject *Sender,
      int ACol, int ARow, const AnsiString Value)
{
  if (Showing && Chart1->Series[StringGrid1->ColCount-ACol-1] != NULL)
  {
    TChartSeries *Series = Chart1->Series[StringGrid1->ColCount-ACol-1];
    Series->MandatoryValueList->Value[ARow-1] = StrToFloatDef(StringGrid1->Cells[ACol][ARow],0);
    Series->Repaint();
  }
}
//---------------------------------------------------------------------------

void __fastcall TGridToChartDemo::Chart1ClickSeries(TCustomChart *Sender,
      TChartSeries *Series, int ValueIndex, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
  ChartTool1->Series = Series;
  // Hide all series marks
  for (int t=0; t<Chart1->SeriesCount(); t++) Chart1->Series[t]->Marks->Visible = false;

  // show clicked series marks
  Series->Marks->Visible = true;
}
//---------------------------------------------------------------------------


void __fastcall TGridToChartDemo::Chart1ClickLegend(TCustomChart *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  Sender->Legend->Inverted = !Sender->Legend->Inverted;
}
//---------------------------------------------------------------------------

void __fastcall TGridToChartDemo::ChartTool1DragPoint(
      TDragPointTool *Sender, int Index)
{
  if (StringGrid1->EditorMode)  StringGrid1->EditorMode = false;

  int ACol = StringGrid1->ColCount-Chart1->SeriesList->IndexOf(Sender->Series)-1;
  int ARow = Index+1;

  StringGrid1->Cells[ACol][ARow] = FloatToStr((int)Sender->Series->MandatoryValueList->Value[ARow-1]);
  StringGrid1->Repaint();

}
//---------------------------------------------------------------------------

