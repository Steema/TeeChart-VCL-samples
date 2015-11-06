//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axes_GridBands.h"
#include "TeeBrushDlg.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TAxesGridBands *AxesGridBands;
//---------------------------------------------------------------------------
__fastcall TAxesGridBands::TAxesGridBands(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxesGridBands::Button1Click(TObject *Sender)
{
  EditChartBrush(this,BandTool->Band1);
}
//---------------------------------------------------------------------------

void __fastcall TAxesGridBands::Button2Click(TObject *Sender)
{
  EditChartBrush(this,BandTool->Band2);
}
//---------------------------------------------------------------------------

void __fastcall TAxesGridBands::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxesGridBands::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series1->Pen->Width = 2;

  // Create GridBandTool...
  BandTool = new TGridBandTool(this);
  BandTool->Axis = Chart1->Axes->Left;

  // cosmetic examples:
  GetTeeBrush(0,BandTool->Band1->Image->Bitmap);
  BandTool->Band1->Color = clBlue;

  BandTool->Band2->Style = bsCross;
  BandTool->Band2->Color = clWhite;

  // Change Left axis grid
  Chart1->Axes->Left->Grid->Color = clRed;
  Chart1->Axes->Left->Grid->Style = psSolid;

  // set 2D
  Chart1->View3D = false;

  // configure ButtonPen
  ButtonPen1->LinkPen(Chart1->Axes->Left->Grid);
}
//---------------------------------------------------------------------------

