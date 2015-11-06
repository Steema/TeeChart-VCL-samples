//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_Pie.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeePieTool"
#pragma resource "*.dfm"
TPieToolDemo *PieToolDemo;
//---------------------------------------------------------------------------
__fastcall TPieToolDemo::TPieToolDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieToolDemo::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  int tmp = ChartTool1->Slice;
  if (tmp == -1)
  {
    Label2->Caption = "";
    Shape1->Visible = false;
  }
  else
  {
    Label2->Caption = Series1->Labels->Labels[tmp];
    Shape1->Visible= true;
    Shape1->Brush->Color = Series1->ValueColor[tmp];
  }
}
//---------------------------------------------------------------------------

void __fastcall TPieToolDemo::FormCreate(TObject *Sender)
{
  // Pie tool has been added at design-time.
  // If you wish to create it at runtime:
  //
  // #include "TeePieTool.hpp";
  // TPieTool *Tool = new TPieTool(this);
  // Tool->ParentChart = Chart1;
  // Tool->Series = Series1;

  // setup pen
  ButtonPen1->LinkPen(ChartTool1->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TPieToolDemo::ButtonPen1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TPieToolDemo::Button1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

