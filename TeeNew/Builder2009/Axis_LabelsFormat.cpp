//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_LabelsFormat.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisLabelsFormat *AxisLabelsFormat;
//---------------------------------------------------------------------------
__fastcall TAxisLabelsFormat::TAxisLabelsFormat(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelsFormat::Chart1GetAxisLabel(TChartAxis *Sender,
      TChartSeries *Series, int ValueIndex, AnsiString &LabelText)
{
  double Num = StrToFloat(LabelText);
  if (Sender == Chart1->Axes->Left)
  {
    if (Num>300) Sender->LabelsFont->Color = clRed;
    else Sender->LabelsFont->Color = clBlue;
  }
  else if (Sender == Chart1->Axes->Bottom)
  {
    if (Num>12) Sender->LabelsFont->Color = clRed;
    else Sender->LabelsFont->Color = clBlue;
  }
}
//---------------------------------------------------------------------------

