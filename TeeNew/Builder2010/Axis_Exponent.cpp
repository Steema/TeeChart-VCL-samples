//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_Exponent.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisLabelExp *AxisLabelExp;
//---------------------------------------------------------------------------
__fastcall TAxisLabelExp::TAxisLabelExp(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelExp::FormCreate(TObject *Sender)
{
  Series1->Clear();
  Series1->Add(1 , "", clTeeColor);
  Series1->Add(10 , "", clTeeColor);
  Series1->Add(100 , "", clTeeColor);
  Series1->Add(1000 , "", clTeeColor);
  Series1->Add(10000 , "", clTeeColor);
  Series1->Add(100000 , "", clTeeColor);
  Series1->Add(1000000 , "", clTeeColor);
}
//---------------------------------------------------------------------------

void __fastcall TAxisLabelExp::CheckBox1Click(TObject *Sender)
{
  Chart1->LeftAxis->LabelsExponent = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxisLabelExp::Edit1Change(TObject *Sender)
{
  Chart1->LeftAxis->AxisValuesFormat = Edit1->Text;
}
//---------------------------------------------------------------------------

