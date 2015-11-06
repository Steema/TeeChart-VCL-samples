//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_LabelAlign.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisLabelAlignForm *AxisLabelAlignForm;
//---------------------------------------------------------------------------
__fastcall TAxisLabelAlignForm::TAxisLabelAlignForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelAlignForm::RadioGroup1Click(TObject *Sender)
{
  // switch between the Left and Right axis
  if (RadioGroup1->ItemIndex == 0) Series1->VertAxis = aLeftAxis;
  else Series1->VertAxis = aRightAxis;

  CheckBox1Click(this);
}
//---------------------------------------------------------------------------

void __fastcall TAxisLabelAlignForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) Series1->GetVertAxis->LabelsAlign = alOpposite;
  else Series1->GetVertAxis->LabelsAlign = alDefault;
}
//---------------------------------------------------------------------------

void __fastcall TAxisLabelAlignForm::FormCreate(TObject *Sender)
{
  // Sample values
  Series1->Add( 278, "Africa", clTeeColor);
  Series1->Add( 123, "America", clTeeColor);
  Series1->Add( 321, "Asia", clTeeColor);
  Series1->Add( 432, "Australia", clTeeColor);
  Series1->Add(  89, "Europe", clTeeColor);
  Series1->Add( 300, "Moon", clTeeColor);

  Series1->Marks->Style = smsPercent;  // show % values

  // Set axes labels to "opposite" alignment
  Chart1->LeftAxis->LabelsAlign = alOpposite;
  Chart1->RightAxis->LabelsAlign = alOpposite;

}
//---------------------------------------------------------------------------

