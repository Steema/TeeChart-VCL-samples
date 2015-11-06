//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Release501_FixedBugs.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRelease501Fixed *Release501Fixed;
//---------------------------------------------------------------------------
__fastcall TRelease501Fixed::TRelease501Fixed(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TRelease501Fixed::FormCreate(TObject *Sender)
{
  StringGrid1->RowCount=32;

  StringGrid1->Cells[0][0]="Fixed bugs";
  StringGrid1->Cells[1][0]="TeeChart Pro Release 5.01";

  StringGrid1->Cells[0][1] ="ADX Function";
  StringGrid1->Cells[0][2] ="Candle Series";
  StringGrid1->Cells[0][3] ="Chart Legend";
  StringGrid1->Cells[0][4] ="Bar and Horiz";
  StringGrid1->Cells[0][5] ="BarSeries";
  StringGrid1->Cells[0][6] ="Bollinger";
  StringGrid1->Cells[0][7] ="BarJoin series";
  StringGrid1->Cells[0][8] ="ChartGrid";
  StringGrid1->Cells[0][9] ="ChartGrid";
  StringGrid1->Cells[0][10]="TeeCommander";
  StringGrid1->Cells[0][11]="SeriesDataSet";
  StringGrid1->Cells[0][12]="Chart Editor";
  StringGrid1->Cells[0][13]="TeeStore";
  StringGrid1->Cells[0][14]="ColorGrid";
  StringGrid1->Cells[0][15]="HighLow series";
  StringGrid1->Cells[0][16]="Chart Editor";
  StringGrid1->Cells[0][17]="Contour series";
  StringGrid1->Cells[0][18]="FunctionType";
  StringGrid1->Cells[0][19]="MarkTipsTool";
  StringGrid1->Cells[0][20]="ChartListBox";
  StringGrid1->Cells[0][21]="SeriesDataSet";
  StringGrid1->Cells[0][22]="ErrorSeries";
  StringGrid1->Cells[0][23]="BackColor";
  StringGrid1->Cells[0][24]="Title and Foot";
  StringGrid1->Cells[0][25]="DrawLine Tool";
  StringGrid1->Cells[0][26]="Contour Series";
  StringGrid1->Cells[0][27]="Zoom Pen";
  StringGrid1->Cells[0][28]="DBChart Horiz";
  StringGrid1->Cells[0][29]="Gallery";
  StringGrid1->Cells[0][30]="Pie Series";
  StringGrid1->Cells[0][31]="Candle Series";

  StringGrid1->Cells[1][1] ="Fixed access violation when destroying the series.";
  StringGrid1->Cells[1][2] ="Fixed reversing of colors (UpClose and DownClose).";
  StringGrid1->Cells[1][3] ="The OnGetLegendText event was not being called.";
  StringGrid1->Cells[1][4] ="(C++ Builder only) CustomBarSize was not possible to use at runtime.";
  StringGrid1->Cells[1][5] ="Several Bar series Stacked with first point 0 now works.";
  StringGrid1->Cells[1][6] ="Fixed division by zero in special circumstances.";
  StringGrid1->Cells[1][7] ="Editor was giving access violation.";
  StringGrid1->Cells[1][8] ="Setting label text to a series with less number of points than other series was not working.";
  StringGrid1->Cells[1][9] ="Changing or setting the Chart property now correctly repaints the grid.";
  StringGrid1->Cells[1][10]="Buttons can now be set invisible.";
  StringGrid1->Cells[1][11]="Null values supported when using the SeriesDataSet in a DBChart.";
  StringGrid1->Cells[1][12]="DBChart DataSources now show datasets in datamodules.";
  StringGrid1->Cells[1][13]="(Delphi 5 and up) Saving charts with functions now correctly reconnect when loading.";
  StringGrid1->Cells[1][14]="Creating grids of size less than 10x10 now works fine.";
  StringGrid1->Cells[1][15]="XValues property is now published.";
  StringGrid1->Cells[1][16]="Selecting Foot / SubFoot property was showing the opposite.";
  StringGrid1->Cells[1][17]="Assign method now supported. (ie: Contour1.Assign(Surface1) )";
  StringGrid1->Cells[1][18]="Now calling Series1.FunctionType.Free works correctly.";
  StringGrid1->Cells[1][19]="Multiple on the same chart now work correctly.";
  StringGrid1->Cells[1][20]="Setting MultiSelect=False now works correctly.";
  StringGrid1->Cells[1][21]="Fixed some errors when used with empty Series.";
  StringGrid1->Cells[1][22]="Horizontal display now works correctly.";
  StringGrid1->Cells[1][23]="Reading a Chart form or tee file created with version 4.03 failed when BackColor was -1.";
  StringGrid1->Cells[1][24]="Chart Title and Foot now save the CustomPosition at design-time.";
  StringGrid1->Cells[1][25]="Accesing the Line[].Pen property no longer fails.";
  StringGrid1->Cells[1][26]="Modifying Level properties of an empty Contour works fine now.";
  StringGrid1->Cells[1][27]="A Chart Zoom Pen (not solid) with Width > 1 displays fine now.";
  StringGrid1->Cells[1][28]="Horiz Series in a DBChart with XY values now plots values fine.";
  StringGrid1->Cells[1][29]="Changing the Series type now preserves axis settings.";
  StringGrid1->Cells[1][30]="The Legend now display correctly when Pie Patterns are used.";
  StringGrid1->Cells[1][31]="Setting DateValues.DateTime to False at design-time works fine now.";
}
//---------------------------------------------------------------------------
