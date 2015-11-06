//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_CursorSynchro.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "SysUtils"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TCursorSynchro *CursorSynchro;
//---------------------------------------------------------------------------
__fastcall TCursorSynchro::TCursorSynchro(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
// This procedure synchronizes two cursors.
// "Source" is the original cursor, and "Dest" the cursor
// that is re-positioned.

void CursorSynchronize( TCursorTool *Source, TCursorTool *Dest)
{
  Dest->ParentChart->AutoRepaint=false; // stop repainting
  Dest->RedrawCursor();   // hide cursor

  Dest->YValue = Source->YValue;
  Dest->XValue = Source->XValue;

  Dest->RedrawCursor();  // draw cursor again
  Dest->ParentChart->AutoRepaint=true; // enable repainting
}
//---------------------------------------------------------------------------

void __fastcall TCursorSynchro::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(1000);
  Series2->DataSource=Series1;

  // move Cursor to center
  ChartTool1->XValue=500;
  ChartTool1->YValue=(Series1->YValues->MaxValue+Series1->YValues->MinValue)/2.0;
}
//---------------------------------------------------------------------------

void __fastcall TCursorSynchro::CheckBox1Click(TObject *Sender)
{
  ChartTool1->FollowMouse=CheckBox1->Checked;
  ChartTool2->FollowMouse=CheckBox1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TCursorSynchro::ShowXY(const double X,const double Y)
{
  Label1->Caption=FormatFloat("#.00",X)+"   "+FormatFloat("#.00",Y);
}

void __fastcall TCursorSynchro::ChartTool2Change(TCursorTool *Sender,
      int x, int y, const double XValue, const double YValue,
      TChartSeries *Series, int ValueIndex)
{
  if (CheckBox2->Checked)
     CursorSynchronize( Sender, ChartTool1 );

  ShowXY(XValue,YValue);
}
//---------------------------------------------------------------------------

void __fastcall TCursorSynchro::ChartTool1Change(TCursorTool *Sender,
      int x, int y, const double XValue, const double YValue,
      TChartSeries *Series, int ValueIndex)
{
  if (CheckBox2->Checked)
     CursorSynchronize( Sender, ChartTool2 );

  ShowXY(XValue,YValue);

}
//---------------------------------------------------------------------------

