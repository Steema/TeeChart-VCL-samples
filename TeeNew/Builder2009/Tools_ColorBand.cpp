//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tools_ColorBand.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TColorBandToolForm *ColorBandToolForm;
//---------------------------------------------------------------------------
__fastcall TColorBandToolForm::TColorBandToolForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorBandToolForm::FormCreate(TObject *Sender)
{
  double vals[5] = {30, 150, 75, 280, 600 };

  Series1->AddArray(vals,4);
}
//---------------------------------------------------------------------------

void __fastcall TColorBandToolForm::CheckBox1Click(TObject *Sender)
{
  // show / hide color bands
  ChartTool1->Active = CheckBox1->Checked;
  ChartTool2->Active = CheckBox1->Checked;
  ChartTool3->Active = CheckBox1->Checked;
  ChartTool4->Active = CheckBox1->Checked;
  ChartTool5->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorBandToolForm::CheckBox2Click(TObject *Sender)
{
  Chart1->LeftAxis->Inverted = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorBandToolForm::CheckBox3Click(TObject *Sender)
{
  ChartTool3->Gradient->Visible = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TColorBandToolForm::CheckBox4Click(TObject *Sender)
{
  ChartTool1->DrawBehind = CheckBox4->Checked;
}
//---------------------------------------------------------------------------


