//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_DragPoint.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeChartGrid"
#pragma resource "*.dfm"
TDragPointToolDemo *DragPointToolDemo;
//---------------------------------------------------------------------------
__fastcall TDragPointToolDemo::TDragPointToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDragPointToolDemo::Button1Click(TObject *Sender)
{
  EditChartTool(this,DragPoint);
}
//---------------------------------------------------------------------------

void __fastcall TDragPointToolDemo::ComboBox1Change(TObject *Sender)
{
  // set the allowed dragging direction...
  switch (ComboBox1->ItemIndex)
  {
    case 0: DragPoint->DragStyle = dsX; break;
    case 1: DragPoint->DragStyle = dsY; break;
    default : DragPoint->DragStyle = dsBoth;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDragPointToolDemo::CheckBox1Click(TObject *Sender)
{
  DragPoint->Active = CheckBox1->Checked;

  // change the series cursor:
  if (DragPoint->Active) Series1->Cursor = crTeeHand;
  else Series1->Cursor = crDefault;
}
//---------------------------------------------------------------------------

void __fastcall TDragPointToolDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);

  // create the tool... }
  DragPoint = new TDragPointTool(this);
  DragPoint->ParentChart = Chart1;
  DragPoint->Series = Series1;

  // set the event...
  DragPoint->OnDragPoint = DragPointEvent;

  // set the grid series
  ChartGrid1->Series = Series1;

  // tell the grid to show both the X and Y
  ChartGrid1->ShowXValues = cgsYes;

  // do not show labels at chart grid
  ChartGrid1->ShowLabels = false;

  // set the Series cursor
  Series1->Cursor = crTeeHand;
}
//---------------------------------------------------------------------------
void __fastcall TDragPointToolDemo::DragPointEvent(TDragPointTool *Sender, int Index)
{
  Series1->Repaint();
  ChartGrid1->Repaint();
}

void __fastcall TDragPointToolDemo::FormShow(TObject *Sender)
{
  // allow dragging in both X and Y directions
  ComboBox1->ItemIndex = 2;
}
//---------------------------------------------------------------------------

