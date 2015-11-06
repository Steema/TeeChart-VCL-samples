//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tools_ColorLine.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TColorLineForm *ColorLineForm;
//---------------------------------------------------------------------------
__fastcall TColorLineForm::TColorLineForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorLineForm::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
  ChartTool2->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorLineForm::CheckBox2Click(TObject *Sender)
{
  Chart1->View3D = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorLineForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  Series2->FillSampleValues(20);
  ButtonPen1->LinkPen(ChartTool1->Pen);
  ButtonPen2->LinkPen(ChartTool2->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TColorLineForm::CheckBox3Click(TObject *Sender)
{
  ChartTool1->AllowDrag = CheckBox3->Checked;
  ChartTool2->AllowDrag = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorLineForm::ChartTool1DragLine(TColorLineTool *Sender)
{
  Label1->Caption = FormatFloat("#.00",Sender->Value);
}
//---------------------------------------------------------------------------

void __fastcall TColorLineForm::ChartTool1EndDragLine(
      TColorLineTool *Sender)
{
  Label1->Caption ="";
}
//---------------------------------------------------------------------------

