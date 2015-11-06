//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "SeriesType_Arrow.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TArrowSeriesForm *ArrowSeriesForm;
//---------------------------------------------------------------------------
__fastcall TArrowSeriesForm::TArrowSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TArrowSeriesForm::CheckBox3Click(TObject *Sender)
{
  Series1->ColorEachPoint = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TArrowSeriesForm::FormCreate(TObject *Sender)
{
  Series1->ArrowWidth = 32;
  Series1->ArrowHeight = 24;
  Series1->XValues->DateTime = false;
  Series1->YValues->DateTime = false;
  AddRandomArrows();
}
//---------------------------------------------------------------------------
void __fastcall TArrowSeriesForm::AddRandomArrows()
{
  double x0,y0,x1,y1;
  Series1->Clear();
  for (int t=1; t<41; t++)
  {
    x0 = random(1000);
    y0 = random(1000);

    x1 = random(300) - 150.0;
    if (x1<50.0) x1 = 50.0;
    x1 = x1+x0;

    y1 = random(300) - 150.0;
    if (y1<50.0) y1 = 50.0;
    y1 = y1+y0;

    Series1->AddArrow(x0,y0,x1,y1, "", clTeeColor );
  }
}
//---------------------------------------------------------------------------

void __fastcall TArrowSeriesForm::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TArrowSeriesForm::CheckBox2Click(TObject *Sender)
{
  Chart1->View3D = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TArrowSeriesForm::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false;
  for (int t=0; t< Series1->Count(); t++)
  {
      Series1->StartXValues->Value[t] = Series1->StartXValues->Value[t]+random(100)-50.0;
      Series1->StartYValues->Value[t]= Series1->StartYValues->Value[t]+random(100)-50.0;
      Series1->EndXValues->Value[t]  = Series1->EndXValues->Value[t]+random(100)-50.0;
      Series1->EndYValues->Value[t]  = Series1->EndYValues->Value[t]+random(100)-50.0;
  }
  Series1->Repaint();
  Timer1->Enabled = true;
}
//---------------------------------------------------------------------------

