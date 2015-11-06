//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_MultiRuntime.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisMultiRuntime *AxisMultiRuntime;
//---------------------------------------------------------------------------
__fastcall TAxisMultiRuntime::TAxisMultiRuntime(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisMultiRuntime::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    Series2->VertAxis = aLeftAxis;
    Series3->VertAxis = aLeftAxis;
    Chart1->LeftAxis->EndPosition = 100;
  }
  else
  {
    Series2->CustomVertAxis = Chart1->CustomAxes->Items[0];
    Series3->CustomVertAxis = Chart1->CustomAxes->Items[1];
    Chart1->LeftAxis->EndPosition = 30;
  }
}
//---------------------------------------------------------------------------

void __fastcall TAxisMultiRuntime::FormCreate(TObject *Sender)
{
  // random data
  Series1->FillSampleValues(1000);
  Series2->FillSampleValues(1000);
  Series3->FillSampleValues(1000);

  // create the axes... 
  TChartAxis *Axis = new TChartAxis( Chart1->CustomAxes );
  Axis->StartPosition = 30;
  Axis->EndPosition = 60;
  Axis->Axis->Color = Series2->SeriesColor;
  Series2->CustomVertAxis = Axis;

  Axis = new TChartAxis( Chart1->CustomAxes );
  Axis->StartPosition = 60;
  Axis->EndPosition = 100;
  Axis->Axis->Color = Series3->SeriesColor;
  Series3->CustomVertAxis = Axis;

  Series1->GetVertAxis->EndPosition = 30;

}
//---------------------------------------------------------------------------

