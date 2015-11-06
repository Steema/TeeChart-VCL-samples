//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "Function_MovAve.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CurvFitt"
#pragma link "StatChar"
#pragma resource "*.dfm"
TMovAveFunctionForm *MovAveFunctionForm;
//---------------------------------------------------------------------------
__fastcall TMovAveFunctionForm::TMovAveFunctionForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMovAveFunctionForm::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked; // <-- animation on / off
}
//---------------------------------------------------------------------------

void __fastcall TMovAveFunctionForm::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false;
  PriceLine->Delete(0); // <-- remove the first point

  /*
    If the MovingAverage RecalcOptions property contains the [rOnDelete]
    recalc option (the default), then the MovingAverages will be
    cleared and recalculated automatically.

    But, if not (speed improvement), we should manually remove the
    first MovingAverage point and force recalculation.
 */
  MovingAve1->Delete(0);
  MovingAve2->Delete(0);
  // Add a new random point }
  PriceLine->AddXY( PriceLine->XValues->Last()+1,
         PriceLine->YValues->Last()+(random(ChartSamplesMax)-(ChartSamplesMax/2)),
         "",clTeeColor);

  // Recalculate Averages
  PriceLine->RefreshSeries();
  Timer1->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TMovAveFunctionForm::Edit2Change(TObject *Sender)
{
  MovingAve1->FunctionType->Period = UpDown2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TMovAveFunctionForm::Edit3Change(TObject *Sender)
{
  MovingAve2->FunctionType->Period = UpDown3->Position;
}
//---------------------------------------------------------------------------

void __fastcall TMovAveFunctionForm::Edit1Change(TObject *Sender)
{
  ExpAverageFunction1->Weight = UpDown1->Position/100.0; // <-- change exponential weight
}
//---------------------------------------------------------------------------

void __fastcall TMovAveFunctionForm::CheckBox3Click(TObject *Sender)
{
  // switch between 2D and 3D and start animating...
  Chart1->View3D = CheckBox3->Checked;
  Chart1->AxisVisible = !Chart1->View3D;
  Chart1->View3DWalls = !Chart1->View3D;
  Chart1->Chart3DPercent = 20;
  Chart1->ClipPoints = !Chart1->View3D;
  Chart1->Frame->Visible = !Chart1->View3D;
  Chart1->Title->Visible = !Chart1->View3D;
  Chart1->Foot->Visible = !Chart1->View3D;
  Chart1->Gradient->Visible = Chart1->View3D;
  if (Chart1->View3D) Chart1->Legend->Alignment = laBottom;
  else Chart1->Legend->Alignment = laLeft;

  Chart1->UndoZoom();
}
//---------------------------------------------------------------------------

void __fastcall TMovAveFunctionForm::FormCreate(TObject *Sender)
{
  /* tell the moving averages not to recalculate when
     we will delete points...
  */
  MovingAve1->RecalcOptions = MovingAve1->RecalcOptions - TSeriesRecalcOptions()<<rOnDelete;
  MovingAve2->RecalcOptions = MovingAve2->RecalcOptions - TSeriesRecalcOptions()<<rOnDelete;

  PriceLine->FillSampleValues(200); // <-- Some random points
}
//---------------------------------------------------------------------------

