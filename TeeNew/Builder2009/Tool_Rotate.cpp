//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_Rotate.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TRotateToolForm *RotateToolForm;
//---------------------------------------------------------------------------
__fastcall TRotateToolForm::TRotateToolForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRotateToolForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TRotateToolForm::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

