//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Welcome.h"
#include <TeeThemes.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeAntiAlias"
#pragma resource "*.dfm"
TWelcomeForm *WelcomeForm;
//---------------------------------------------------------------------------
__fastcall TWelcomeForm::TWelcomeForm(TComponent* Owner)
        : TForm(Owner)
{
  Delta = 1;
  DeltaElev = 1;
  DeltaRot = 1;
  NewRotation = 30;

  Series1->FillSampleValues(8);
  Series2->FillSampleValues(30);
  Series3->FillSampleValues(30);
  Series4->FillSampleValues(50);
  TheSeries=Series1;  // the series to animate...

  Chart1->View3DOptions->Zoom=1; // start with a very small view...

  Series1->Gradient->Direction = gdTopBottom;
}
//---------------------------------------------------------------------------
void AddPoint(TChartSeries *ASeries)
{
  ASeries->AddXY(ASeries->XValues->Last()+1,ASeries->YValues->Last()+random(20)-10,"",clTeeColor);
  ASeries->Delete(0);
}

void __fastcall TWelcomeForm::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false;
  try
  {
    if (TheSeries->ClassType()==__classid(TPieSeries))
    {
      dynamic_cast<TPieSeries *>(TheSeries)->RotationAngle+=2;
    }
    else
    {
      AddPoint(Series2);
      AddPoint(Series3);
      AddPoint(Series4);
      Chart1->View3DOptions->Elevation+=DeltaElev;
      if ((Chart1->View3DOptions->Elevation>350) || (Chart1->View3DOptions->Elevation<280))
         DeltaElev= (-DeltaElev);
      NewRotation += DeltaRot;
      if ( (NewRotation > 358) || (NewRotation < 1))
         DeltaRot= (-DeltaRot);
      Chart1->View3DOptions->Rotation = NewRotation;
    }

    Chart1->View3DOptions->Zoom+=Delta;
    if ((Chart1->View3DOptions->Zoom>200) || (Chart1->View3DOptions->Zoom<2))
       Delta = (-Delta);

    if (Chart1->View3DOptions->Zoom>200)
    {
      Series1->Active=false;
      Series2->Active=false;
      Series3->Active=false;
      Series4->Active=false;
      if (TheSeries==Series1)
      {
        TheSeries=Series2;
        Series2->Active=true;
        Series3->Active=true;
        Series4->Active=true;
        Chart1->View3DOptions->Perspective=75;
        Chart1->View3DOptions->Rotation=300;
        NewRotation = 30;
      }
      else
      {
        TheSeries=Series1;
        Chart1->View3DOptions->Rotation=360;
        TheSeries->Active=true;

        // Change Pie colors to Blue
        int ColorDelta =255/TheSeries->Count();
        for (int t=0; t<TheSeries->Count(); t++)
            TheSeries->ValueColor[t] = ApplyBright(clNavy,t*ColorDelta);

      }
   }
  }
  __finally
  {
    Timer1->Enabled = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TWelcomeForm::FormShow(TObject *Sender)
{
  Timer1->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TWelcomeForm::estExcelTheme1Click(TObject *Sender)
{
    TWindowsXPTheme *xptheme = new TWindowsXPTheme(Chart1);
    try
    {
      xptheme->Apply();

    }
    __finally
    {
      delete xptheme;
    }
}
//---------------------------------------------------------------------------

void __fastcall TWelcomeForm::Timer2Timer(TObject *Sender)
{
  Timer2->Enabled = false;
  estExcelTheme1Click(this);
}
//---------------------------------------------------------------------------

