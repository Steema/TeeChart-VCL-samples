//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Polar.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeeEdit"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TPolarForm *PolarForm;
//---------------------------------------------------------------------------
__fastcall TPolarForm::TPolarForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPolarForm::FormCreate(TObject *Sender)
{
  PolarSeries1->FillSampleValues(20);
  PolarSeries1->Cursor = crTeeHand;

  PolarSeries2->FillSampleValues(25);
  PolarSeries2->Cursor = crTeeHand;
}
//---------------------------------------------------------------------------

void __fastcall TPolarForm::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPolarForm::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false;

  // Move Points !!!
  PolarSeries1->Rotate(5);
  PolarSeries2->Rotate(355);

  //  Change Grid Lines and Horizontal Axis Labels
  TChartAxis *ba = Chart1->BottomAxis;
  if (ba->Increment == 0.0 || ba->Increment>=90.0) ba->Increment = 1.0;
  else ba->Increment += 2.0;

  //  Change Grid RINGS and Vertical Axis Labels }
  ba = Chart1->LeftAxis;
  if (ba->Increment == 0.0 || ba->Increment>=(ba->Maximum-ba->Minimum)/2.0)
    ba->Increment = (ba->Maximum-ba->Minimum)/20.0;
  else ba->Increment = 2.0*ba->Increment;

  Timer1->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TPolarForm::CheckBox2Click(TObject *Sender)
{
  PolarSeries1->Circled = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPolarForm::PolarSeries1Click(TChartSeries *Sender,
      int ValueIndex, TMouseButton Button, TShiftState Shift, int X, int Y)
{
  ShowMessage(AnsiString("You clicked: ")+Sender->Name+
              AnsiString("\n Angle : ")+FloatToStr(Sender->XValues->Value[ValueIndex])+
              AnsiString("\n Radius: ")+FloatToStr(Sender->YValues->Value[ValueIndex]));
}
//---------------------------------------------------------------------------

void __fastcall TPolarForm::Chart1AfterDraw(TObject *Sender)
{
  Chart1->Canvas->Brush->Style = bsClear;  // <-- IMPORTANT (Try without) !!!

  Chart1->Canvas->Pen->Width = 2;

  // Draw a blue ring passing over the 3rd PolarSeries1 Point
  Chart1->Canvas->Pen->Color = clBlue;
  PolarSeries1->DrawRing( PolarSeries1->YValues->Value[2], PolarSeries1->EndZ );

  // Draw a green ring passing over the 6th PolarSeries2 Point
  Chart1->Canvas->Pen->Color = clGreen;
  PolarSeries2->DrawRing( PolarSeries2->YValues->Value[5], PolarSeries2->EndZ );
}
//---------------------------------------------------------------------------

