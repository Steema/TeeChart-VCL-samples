//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_Cursor.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeEdit"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TCursorToolDemo *CursorToolDemo;
//---------------------------------------------------------------------------
__fastcall TCursorToolDemo::TCursorToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCursorToolDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;   // enable / disable the first cursor
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolDemo::ChartTool1Change(TCursorTool *Sender,
      int x, int y, const double XValue, const double YValue,
      TChartSeries *Series, int ValueIndex)
{
  // show the cursor values...
  Label1->Caption = FormatFloat("#.00",XValue)+","+FormatFloat("#.00",YValue);
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolDemo::CheckBox2Click(TObject *Sender)
{
  // set / unset cursor "Snap" (automatic moving of cursor to points)
  ChartTool1->Snap = CheckBox2->Checked;
  // change the cursor style...
  ChartTool1->Style = cssVertical;
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolDemo::ChartTool2Change(TCursorTool *Sender,
      int x, int y, const double XValue, const double YValue,
      TChartSeries *Series, int ValueIndex)
{
  // show the cursor values...
  Label2->Caption = FormatFloat("#.00",XValue)+","+FormatFloat("#.00",YValue);
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
  Series2->FillSampleValues(100);
  Chart1->LeftAxis->Minimum = 0;
}
//---------------------------------------------------------------------------

void __fastcall TCursorToolDemo::Button1Click(TObject *Sender)
{
  ChartEditor1->Execute();  // show the chart editor dialog
}
//---------------------------------------------------------------------------

