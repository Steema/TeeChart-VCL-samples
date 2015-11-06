//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tools_DrawLine.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TDrawLineToolDemo *DrawLineToolDemo;
//---------------------------------------------------------------------------
__fastcall TDrawLineToolDemo::TDrawLineToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDrawLineToolDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
  ButtonPen1->LinkPen(ChartTool1->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::ChartTool1NewLine(TObject *Sender)
{
  NumLines->Caption = IntToStr(ChartTool1->Lines->Count);
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::ButtonPen1Click(TObject *Sender)
{
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::ComboBox1Change(TObject *Sender)
{
  ChartTool1->Button = TMouseButton(ComboBox1->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::CheckBox2Click(TObject *Sender)
{
  ChartTool1->EnableDraw = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::CheckBox3Click(TObject *Sender)
{
  ChartTool1->EnableSelect = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::ChartTool1Select(TObject *Sender)
{
  ButtonDelete->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::ButtonDeleteClick(TObject *Sender)
{
  ChartTool1->DeleteSelected();
  ButtonDelete->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineToolDemo::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

