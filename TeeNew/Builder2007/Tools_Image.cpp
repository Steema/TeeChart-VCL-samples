//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "Tools_Image.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TImageToolForm *ImageToolForm;
//---------------------------------------------------------------------------
__fastcall TImageToolForm::TImageToolForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TImageToolForm::FormCreate(TObject *Sender)
{
  OldZoom = -1;

  Series1->FillSampleValues(20);

  Series2->Clear();
  for (int t=1; t< 50; t++)
    Series2->AddXY(1+random(20),1+random(20),"",clTeeColor);

}
//---------------------------------------------------------------------------

void __fastcall TImageToolForm::ScrollBar1Change(TObject *Sender)
{
  if (ScrollBar1->Position > OldZoom) Chart1->ZoomPercent(105);
  else Chart1->ZoomPercent(95);

  OldZoom = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TImageToolForm::Button1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TImageToolForm::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

