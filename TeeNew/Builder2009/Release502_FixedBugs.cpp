//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Release502_FixedBugs.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRelease502Fixed *Release502Fixed;
//---------------------------------------------------------------------------
__fastcall TRelease502Fixed::TRelease502Fixed(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TRelease502Fixed::FormCreate(TObject *Sender)
{
  StringGrid1->RowCount=25;

  StringGrid1->Cells[0][0]="Fixed bugs";
  StringGrid1->Cells[1][0]="TeeChart Pro Release 5.02";

  StringGrid1->Cells[0][1] ="Chart Wall";
  StringGrid1->Cells[0][2] ="CloneChartSeries";
  StringGrid1->Cells[0][3] ="Chart Title Editor";
  StringGrid1->Cells[0][4] ="Gallery";
  StringGrid1->Cells[0][5] ="Series Assign";
  StringGrid1->Cells[0][6] ="Brush Style";
  StringGrid1->Cells[0][7] ="Shape Series";
  StringGrid1->Cells[0][8] ="Pie Series";
  StringGrid1->Cells[0][9] ="Pie Series (CLX)";
  StringGrid1->Cells[0][10] ="XML Data Export";
  StringGrid1->Cells[0][11] ="Polar Series";
  StringGrid1->Cells[0][12] ="Tools and Chart Cursor";
  StringGrid1->Cells[0][13] ="Box-Plot and Median";
  StringGrid1->Cells[0][14] ="Titles and Footers";
  StringGrid1->Cells[0][15] ="Pie Shadow";
  StringGrid1->Cells[0][16] ="Donut Series Assign";
  StringGrid1->Cells[0][17] ="Polar and Radar";
  StringGrid1->Cells[0][18] ="Legend Clicked";
  StringGrid1->Cells[0][19] ="DrawLine Tool";
  StringGrid1->Cells[0][20] ="Axis Title";
  StringGrid1->Cells[0][21] ="TeeFunctions";
  StringGrid1->Cells[0][22] ="Bezier Series";
  StringGrid1->Cells[0][23] ="Radar/Polar Series";
  StringGrid1->Cells[0][24] ="Smith Series";

  StringGrid1->Cells[1][1] ="Fixed storing to DFM the LeftWall Color when is White.";
  StringGrid1->Cells[1][2] ="Fixed Access Violation when Series.ParentChart was nil.";
  StringGrid1->Cells[1][3] ="Selection from Foot and SubFoot was inverted.";
  StringGrid1->Cells[1][4] ="If the dropped sub-gallery is outside the right side, it is moved.";
  StringGrid1->Cells[1][5] ="Fixed bug when assigning a Bar Series to HorizBar series.";
  StringGrid1->Cells[1][6] ="Version 5.01 introduced a bug in Brush Style when using extended styles.";
  StringGrid1->Cells[1][7] ="Fixed bug when using a Brush Style non solid.";
  StringGrid1->Cells[1][8] ="Pie Series restores original 3D settings when removing or changing it.";
  StringGrid1->Cells[1][9] ="Pie Series in 2D under Kylix (CLX) painting bug.";
  StringGrid1->Cells[1][10] ="XML exporting now works with X values.";
  StringGrid1->Cells[1][11] ="Polar and Radar transparent with Brush.Color=clNone";
  StringGrid1->Cells[1][12] ="Some tools (like CursorTool) wrongly reset the Chart Cursor to default.";
  StringGrid1->Cells[1][13] ="Box-Plot series Median was incorrectly calculated.";
  StringGrid1->Cells[1][14] ="Titles with Custom Position are now displayed on top of chart";
  StringGrid1->Cells[1][15] ="Pie Series Shadow property is now published, (it was public)";
  StringGrid1->Cells[1][16] ="Donut Series now uses Assign to copy HolePercent from other Donut Series";
  StringGrid1->Cells[1][17] ="Setting CircleBackColor to clNone now uses it as transparent.";
  StringGrid1->Cells[1][18] ="Clicked function was not working fine with Inverted and Horizontal Legend.";
  StringGrid1->Cells[1][19] ="Calling DeleteSelected while drawing a line was causing an AV.";
  StringGrid1->Cells[1][20] ="When Axis LabelsExponent is True, Title did not display 'e' characters.";
  StringGrid1->Cells[1][21] ="Fixed problem using multiple Series as datasources, when the first series is empty.";
  StringGrid1->Cells[1][22] ="Bezier series was not calling OnGetPointerStyle event.";
  StringGrid1->Cells[1][23] ="Radar and Polar series display now better rotated labels.";
  StringGrid1->Cells[1][24] ="Smith series uses now ShowLabels property.";
}
//---------------------------------------------------------------------------
