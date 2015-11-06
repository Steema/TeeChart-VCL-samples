//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Release503_FixedBugs.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRelease503Fixed *Release503Fixed;
//---------------------------------------------------------------------------
__fastcall TRelease503Fixed::TRelease503Fixed(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRelease503Fixed::FormCreate(TObject *Sender)
{
  StringGrid1->RowCount = 9;

  StringGrid1->Cells[0][0] = "Fixed bugs";
  StringGrid1->Cells[1][0] = "TeeChart Pro Release 5.03";

  StringGrid1->Cells[0][1] = "Pie Series";
  StringGrid1->Cells[0][2] = "All 3D Series";
  StringGrid1->Cells[0][3] = "Legend";
  StringGrid1->Cells[0][4] = "Logarithmic Axes";
  StringGrid1->Cells[0][5] = "Bar Series";
  StringGrid1->Cells[0][6] = "Transparency";
  StringGrid1->Cells[0][7] = "Polar / WindRose";
  StringGrid1->Cells[0][8] = "Right Axis";

  StringGrid1->Cells[1][1] = "Fixed Pie Clicked function when Pie is shown in 3D.";
  StringGrid1->Cells[1][2] = "Fixed Color Palette generation (Surface,Contour,Map,etc).";
  StringGrid1->Cells[1][3] = "Large Horizontal Legend with CheckBoxes does not override bounds.";
  StringGrid1->Cells[1][4] = "Fixed exception when calculating logarithmic axis positions before the chart was first time displayed.";
  StringGrid1->Cells[1][5] = "Fixed bug in Bar series with CustomBarWidth > 0 and BarWidthPercent = 100.";
  StringGrid1->Cells[1][6] = "All Transparency properties are now published into DFM and *.tee streams.";
  StringGrid1->Cells[1][7] = "New Color button in Polar and WindRose editor dialogs.";
  StringGrid1->Cells[1][8] = "Fixed OnClickAxis event for Right Axis in 3D mode.";
}
//---------------------------------------------------------------------------

