//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_LabelsAlternate.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAlternateAxisLabels *AlternateAxisLabels;
//---------------------------------------------------------------------------
__fastcall TAlternateAxisLabels::TAlternateAxisLabels(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
TChartAxis* __fastcall TAlternateAxisLabels::TheAxis()
{
  TChartAxis *result = Chart1->Axes->Bottom;
  switch (RadioGroup1->ItemIndex)
  {
    case 0 : result = Chart1->Axes->Left; break;
    case 1 : result = Chart1->Axes->Top; break;
    case 2 : result = Chart1->Axes->Right; break;
  }
  return result;
}

void __fastcall TAlternateAxisLabels::HighlightAxis(TChartAxis *Axis)
{
  if (TheAxis()==Axis) Axis->LabelsFont->Style = TFontStyles()<< fsBold;
  else Axis->LabelsFont->Style = TFontStyles();
}

void __fastcall TAlternateAxisLabels::Highlight()
{
  HighlightAxis(Chart1->Axes->Left);
  HighlightAxis(Chart1->Axes->Right);
  HighlightAxis(Chart1->Axes->Top);
  HighlightAxis(Chart1->Axes->Bottom);
}

void __fastcall TAlternateAxisLabels::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();

  Chart1->Axes->Left->LabelsAlternate = true;
  Chart1->Axes->Top->LabelsAlternate = true;
  Chart1->Axes->Right->LabelsAlternate = true;
  Chart1->Axes->Bottom->LabelsAlternate = true;

  Highlight();
}
//---------------------------------------------------------------------------

void __fastcall TAlternateAxisLabels::CheckBox1Click(TObject *Sender)
{
  TheAxis()->LabelsAlternate = CheckBox1->Checked;

  Highlight();
}
//---------------------------------------------------------------------------

void __fastcall TAlternateAxisLabels::RadioGroup1Click(TObject *Sender)
{
  CheckBox1->Checked = TheAxis()->LabelsAlternate;

  Highlight();
}
//---------------------------------------------------------------------------

