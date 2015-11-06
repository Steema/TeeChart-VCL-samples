//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_Annotation.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma link "EditChar"
#pragma resource "*.dfm"
TAnnotationToolForm *AnnotationToolForm;
//---------------------------------------------------------------------------
__fastcall TAnnotationToolForm::TAnnotationToolForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAnnotationToolForm::Button1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationToolForm::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active=CheckBox1->Checked;
  ChartTool2->Active=CheckBox1->Checked;
  ChartTool3->Active=CheckBox1->Checked;
}
//---------------------------------------------------------------------------

