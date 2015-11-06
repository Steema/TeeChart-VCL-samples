//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Point3D.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePoin3"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TPoint3DSeriesForm *Point3DSeriesForm;
//---------------------------------------------------------------------------
__fastcall TPoint3DSeriesForm::TPoint3DSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPoint3DSeriesForm::FormCreate(TObject *Sender)
{
  DeltaRotate = -5;
  DeltaElevate = -4;

  Series1->FillSampleValues(100);
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DSeriesForm::CheckBox4Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox4->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DSeriesForm::Timer1Timer(TObject *Sender)
{
  TView3DOptions *Opt = Chart1->View3DOptions;
  Opt->Rotation = Opt->Rotation+DeltaRotate;
  if (Opt->Rotation < 280 || Opt->Rotation > 350) DeltaRotate = -DeltaRotate;

  Opt->Elevation = Opt->Elevation + DeltaElevate;
  if (Opt->Elevation<280 || Opt->Elevation > 350) DeltaElevate = -DeltaElevate;
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DSeriesForm::CheckBox5Click(TObject *Sender)
{
  Chart1->View3DWalls = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DSeriesForm::CheckBox3Click(TObject *Sender)
{
  Series1->ColorEachPoint = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DSeriesForm::CheckBox2Click(TObject *Sender)
{
  Series1->Pointer->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DSeriesForm::CheckBox1Click(TObject *Sender)
{
  Series1->LinePen->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPoint3DSeriesForm::CheckBox6Click(TObject *Sender)
{
  Chart1->AxisVisible = CheckBox6->Checked;
}
//---------------------------------------------------------------------------

