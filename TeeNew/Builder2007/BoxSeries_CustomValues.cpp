//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BoxSeries_CustomValues.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeBoxPlot"
#pragma resource "*.dfm"
TBoxCustomForm *BoxCustomForm;
//---------------------------------------------------------------------------
__fastcall TBoxCustomForm::TBoxCustomForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBoxCustomForm::UpdateDisplay(void)
{
  Label1->Caption = "Median = " + FormatFloat("0.00",Series1->Median);
  Label2->Caption = "Inner Fences = ["+FormatFloat("0.00",Series1->InnerFence1)+
    " ; "+FormatFloat("0.00",Series1->InnerFence3)+"]";
  Label3->Caption = "Outer Fences = ["+FormatFloat("0.00",Series1->OuterFence1)+
    " ; "+FormatFloat("0.00",Series1->OuterFence3)+"]";
}
//---------------------------------------------------------------------------

void __fastcall TBoxCustomForm::CheckBox1Click(TObject *Sender)
{
  Series1->UseCustomValues = CheckBox1->Checked;
  if (Series1->UseCustomValues)
  {
    Series1->Median = 15;
    Series1->Quartile1 = 13;
    Series1->Quartile3 = 17;
    Series1->InnerFence1 = 12;
    Series1->InnerFence3 = 18;
    Series1->OuterFence1 = 10;
    Series1->OuterFence3 = 20;
  }
  Chart1->Repaint();
  UpdateDisplay();
}
//---------------------------------------------------------------------------

void __fastcall TBoxCustomForm::FormCreate(TObject *Sender)
{
  // add sample data
  double values[8] = {12, 14, 18, 18.5, 18.6, 18.6, 19, 24};
  Series1->Clear();
  Series1->AddArray(values,8);
  Series1->UseCustomValues = false; // by default, use internal calculating algorithms
  UpdateDisplay();
}
//---------------------------------------------------------------------------

