//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#include <stdlib.h>
#pragma hdrstop

#include "SeriesType_FastLine.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFastLineForm *FastLineForm;
//---------------------------------------------------------------------------
__fastcall TFastLineForm::TFastLineForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFastLineForm::FormCreate(TObject *Sender)
{
  // Make the chart flicker by default, only for this demo
  Chart1->BufferedDisplay = false;

  // hide things for better speed
  Chart1->View3D = false;
  Chart1->Legend->Visible = false;
  Chart1->Title->Visible = false;
  Chart1->Foot->Visible = false;

  // some speed improvement if...
  TeeDefaultCapacity = 1000;

  // 1000 random points each series
  randomize();
  int tmpRandom;
  for (int t=1; t< 1000; t++)
  {
    tmpRandom = random(abs(500-t))-(abs(500-t)/2);
    FastLineSeries1->Add(1000-t+tmpRandom,"",clTeeColor);
    FastLineSeries2->Add(t+tmpRandom,"",clTeeColor);
  }
}
//---------------------------------------------------------------------------

void __fastcall TFastLineForm::CheckBox1Click(TObject *Sender)
{
  Chart1->BufferedDisplay = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineForm::CheckBox2Click(TObject *Sender)
{
  Chart1->AxisVisible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineForm::CheckBox3Click(TObject *Sender)
{
  Chart1->ClipPoints = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineForm::Button1Click(TObject *Sender)
{
  int t1,t2;
  Screen->Cursor = crHourGlass;
  try
  {
    Chart1->AnimatedZoom = false;

    t1 = GetTickCount();
    for (int t=1; t<30; t++) Chart1->ZoomPercent(105);  // 5% zoom in
    for (int t=1; t<30; t++) Chart1->ZoomPercent(95); // 5% zoom out
    t2 = GetTickCount();

    Chart1->AnimatedZoom = true;
    Chart1->UndoZoom();
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
  ShowMessage(AnsiString("Time to plot 2000 points \n") +
   AnsiString("61 times: \n") + IntToStr(t2-t1)+ AnsiString(" milliseconds."));
}
//---------------------------------------------------------------------------

