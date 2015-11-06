//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "SeriesType_Contour.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TContourSeriesForm *ContourSeriesForm;
//---------------------------------------------------------------------------
__fastcall TContourSeriesForm::TContourSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
  double ToAngle(int Value)
  {
        double Res = ((Value+10)*18)*M_PI/180.0;
        return Res;
  }

double __fastcall TContourSeriesForm::RandomXYZ(int X, int Z)
{
  double Res = 500.0*(sin(ToAngle(X)) + pow(cos(ToAngle(Z)),2));
  return Res;
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = !CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::FormCreate(TObject *Sender)
{
  ScrollBar1->Align = alRight;
  // First we add XYZ points to the Contour series...
  ContourSeries->Clear(); // We add values from 0 to 1000.  21x21 cells = 441
    for (int x = -10; x<10;x++)
      for (int z= -10;z<10;z++) ContourSeries->AddXYZ(x, RandomXYZ(x,z) ,z, "", clTeeColor);

  // Then we specify how many "contour levels" we want
  ContourSeries->NumLevels = 10;

  // We specify the Y levels position to the "middle"
  ContourSeries->YPosition =(ContourSeries->YValues->MaxValue+ContourSeries->YValues->MinValue)/2.0;

  ScrollBar1->Position = 1000-floor(ContourSeries->YPosition);

  // We can set some Chart properties to improve aspect
  Chart1->Chart3DPercent = 100;

  // We can also use a Surface series...
  SurfaceSeries->DataSource = ContourSeries;
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::CheckBox5Click(TObject *Sender)
{
  Chart1->View3DWalls = CheckBox5->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::CheckBox2Click(TObject *Sender)
{
  ContourSeries->ColorEachPoint = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::ContourSeriesGetLevel(
      TContourSeries *Sender, int LevelIndex, double &Value, TColor &Color)
{
  // Here we specify the 10 Level values }
  switch (LevelIndex)
  {
    case 0: Value = 0; break;
    case 1: Value = 100; break;
    case 2: Value = 200; break;
    case 3: Value = 300; break;
    case 4: Value = 400; break;
    case 5: Value = 500; break;
    case 6: Value = 600; break;
    case 7: Value = 700; break;
    case 8: Value = 800; break;
    case 9: Value = 900; break;
    default : Value = LevelIndex*100.0;
  }
  /* We can also specify here the exact Color for each level.
     For example:
     if (Value = 500) Color = clRed;
  */
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::CheckBox3Click(TObject *Sender)
{
  SurfaceSeries->Active = CheckBox3->Checked; // show / hide surface
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::CheckBox4Click(TObject *Sender)
{
  // Turn on / off the automatic Y level positions
  ContourSeries->YPositionLevel = CheckBox4->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TContourSeriesForm::ScrollBar1Change(TObject *Sender)
{
  // We don't want each Level to have automatic Y position
  ContourSeries->YPositionLevel = false;

  // Force the Level Y position
  ContourSeries->YPosition = 1000-ScrollBar1->Position;
}
//---------------------------------------------------------------------------

