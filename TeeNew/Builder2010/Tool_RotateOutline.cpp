//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_RotateOutline.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TRotateOutline *RotateOutline;
//---------------------------------------------------------------------------
__fastcall TRotateOutline::TRotateOutline(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRotateOutline::CheckBox1Click(TObject *Sender)
{
  // Show or Hide Rotate outline
  ChartTool1->Pen->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRotateOutline::FormCreate(TObject *Sender)
{
  // Enable Rotate tool "Outline"
  ChartTool1->Pen->Visible = true;

  // set-up button
  ButtonPen1->LinkPen(ChartTool1->Pen);
}
//---------------------------------------------------------------------------

