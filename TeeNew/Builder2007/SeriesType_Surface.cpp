//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#include <stdlib.h>
#pragma hdrstop

#include "SeriesType_Surface.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSurfaceSeriesForm *SurfaceSeriesForm;
//---------------------------------------------------------------------------
__fastcall TSurfaceSeriesForm::TSurfaceSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceSeriesForm::FormCreate(TObject *Sender)
{
  SurfaceSeries1->FillSampleValues(30);
}
//---------------------------------------------------------------------------

double __fastcall TSurfaceSeriesForm::SurfaceSeries1GetYValue(
      TChartSeries *Sender, int X, int Z)
{
  double PiPortion = M_PI/(SurfaceSeries1->NumXValues);
  double Res = 0.0;
  double tmpX = X*PiPortion;
  double tmpZ = Z*PiPortion;
  switch (UpDown1->Position) // sample surfaces
  {
    case 1: Res = 0.5*pow(cos(X/(SurfaceSeries1->NumXValues*0.2)),2)+
                     pow(cos(Z/(SurfaceSeries1->NumXValues*0.2)),2)-
                     cos(Z/(SurfaceSeries1->NumXValues*0.5)); break;
    case 2: Res = pow( cos(tmpX),2) * pow( sin(tmpZ),2 ); break;
    case 3: Res = cos(tmpX*tmpX)+sin(tmpZ*tmpZ); break;
    case 4: Res = pow(cos(tmpX),2)+pow(sin(tmpZ),2); break;
    case 5: Res = -tmpX+pow(tmpZ,2)*sin(tmpX*tmpZ); break;
    case 6: Res = sqrt(tmpX * tmpX + tmpZ * tmpZ); break;
    case 7: Res = cos(abs(tmpX-M_PI_2))*sin(tmpZ); break;
    case 8: Res = cos(abs(tmpX-M_PI_2)*abs(tmpZ-M_PI_2)); break;
  }

  return Res;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSeriesForm::Edit1Change(TObject *Sender)
{
  SurfaceSeries1->ReCreateValues();
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSeriesForm::Animation1Click(TObject *Sender)
{
  randomize();
  Timer1->Enabled = Animation1->Checked;  // start / stop timer
}
//---------------------------------------------------------------------------

  TColor __fastcall RandomColor()
  {
    return GetDefaultColor(random(100));
  }

void __fastcall TSurfaceSeriesForm::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false;  // stop animation timer

  // Invert Left axis randomly
  if (random(100)<2) Chart1->LeftAxis->Inverted = !Chart1->LeftAxis->Inverted;
  // Invert Bottom axis randomly
  if (random(100)<2) Chart1->BottomAxis->Inverted = !Chart1->BottomAxis->Inverted;
  // Invert Depth axis randomly
  if (random(100)<2) Chart1->DepthAxis->Inverted = !Chart1->DepthAxis->Inverted;

  // Change Color Mode (Single, Range or Palette) randomly
  if (random(100)<2)
  {
    if (CBColorMode->ItemIndex<3) CBColorMode->ItemIndex = CBColorMode->ItemIndex+1;
    else CBColorMode->ItemIndex = 0;
    CBColorModeChange(this);
  }

  // Change Chart Gradient Colors randomly (only at 16k colors or greater)
  if (random(100)<10) Chart1->Gradient->StartColor = RandomColor();
  else if (random(100)<10) Chart1->Gradient->EndColor = RandomColor();

  // Random change Surface and Chart colors
  switch (CBColorMode->ItemIndex)
  {
    case 0: if (random(100)<15) SurfaceSeries1->SeriesColor = RandomColor(); break; // single color
    case 1: { // color range
              if (random(100)<15) SurfaceSeries1->StartColor = RandomColor();
              else if (random(100)<15) SurfaceSeries1->EndColor = RandomColor();
            } break;
  }
  // random change pen color }
  if (random(100)<15) SurfaceSeries1->Pen->Color = RandomColor();

  // Change Surface Example: }
  if (UpDown1->Position < UpDown1->Max) UpDown1->Position = UpDown1->Position+1;
  else UpDown1->Position = UpDown1->Min;

  Timer1->Enabled = true;  // re-start animation timer

}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSeriesForm::CBColorModeChange(TObject *Sender)
{
  switch (CBColorMode->ItemIndex)
  {
    case 0:{
            SurfaceSeries1->UseColorRange = false;
            SurfaceSeries1->UsePalette = false;
           } break;
    case 1:{
            SurfaceSeries1->UseColorRange = true;
            SurfaceSeries1->UsePalette = false;
           } break;
    case 2:{
            SurfaceSeries1->UseColorRange = false;
            SurfaceSeries1->UsePalette = true;
            SurfaceSeries1->PaletteStyle = psPale;
           } break;
    case 3:{
            SurfaceSeries1->UseColorRange = false;
            SurfaceSeries1->UsePalette = true;
            SurfaceSeries1->PaletteStyle = psStrong;
           } break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSeriesForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0:{
              SurfaceSeries1->WireFrame = false;
              SurfaceSeries1->DotFrame = false;
              SurfaceSeries1->Pen->Visible = true;
           } break;
    case 1:{
              SurfaceSeries1->WireFrame = false;
              SurfaceSeries1->DotFrame = false;
              SurfaceSeries1->Pen->Visible = false;
           } break;
    case 2:{
              SurfaceSeries1->WireFrame = true;
              SurfaceSeries1->Pen->Visible = true;
           } break;
    case 3:{
              SurfaceSeries1->DotFrame = true;
           } break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSeriesForm::FormShow(TObject *Sender)
{
  CBColorMode->ItemIndex = 3;
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

