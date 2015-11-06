//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorLine_DragRepaint.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TColorLineDragRepaint *ColorLineDragRepaint;
//---------------------------------------------------------------------------
__fastcall TColorLineDragRepaint::TColorLineDragRepaint(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorLineDragRepaint::FormCreate(TObject *Sender)
{
  const double Values[]={40,220,140,512,256,310,60,100,600};
  Series1->AddArray(Values,ARRAYSIZE(Values));
}
//---------------------------------------------------------------------------

void __fastcall TColorLineDragRepaint::CheckBox1Click(TObject *Sender)
{
  ChartTool1->DragRepaint=CheckBox1->Checked;
  ChartTool2->DragRepaint=CheckBox1->Checked;
  ChartTool3->DragRepaint=CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorLineDragRepaint::CheckBox2Click(TObject *Sender)
{
  Chart1->View3D=CheckBox2->Checked;
}
//---------------------------------------------------------------------------

