//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "Function_CurveFitting.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CurvFitt"
#pragma resource "*.dfm"
TCurveFittingForm *CurveFittingForm;
//---------------------------------------------------------------------------
__fastcall TCurveFittingForm::TCurveFittingForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCurveFittingForm::FormCreate(TObject *Sender)
{
  Curve1->RecalcOptions = TSeriesRecalcOptions()<<rOnInsert <<rOnClear;
  Data->FillSampleValues(200); // <-- Some random points
}
//---------------------------------------------------------------------------

void __fastcall TCurveFittingForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->PolyDegree = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TCurveFittingForm::Edit2Change(TObject *Sender)
{
  TeeFunction2->PolyDegree = UpDown2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TCurveFittingForm::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCurveFittingForm::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false; // <-- stop timer
  Data->Delete(0); // <-- remove the first point
  // Add a new random point
  Data->AddXY( Data->XValues->Last()+1,
           Data->YValues->Last()+(random(ChartSamplesMax)-(ChartSamplesMax/2.0)),
           "",clTeeColor);

  Curve1->CheckDataSource(); // <-- fill again the points
  Curve2->CheckDataSource(); // <-- fill again the points
  Timer1->Enabled = true; // <-- restart timer
}
//---------------------------------------------------------------------------

