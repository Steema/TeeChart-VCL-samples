//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Polar_Zones.h"
#include "TeeEdiGrad.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TPolarZones *PolarZones;
//---------------------------------------------------------------------------
__fastcall TPolarZones::TPolarZones(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPolarZones::DrawPolarZones(void)
{
  if (Series1->CircleXCenter != 0)
  {
    // Hide pen
    Chart1->Canvas->Pen->Style = psClear;

    // Draw three zones (green, yellow and red)

    Chart1->Canvas->Brush->Color = clGreen;
    Series1->DrawZone(0,100,Chart1->Width3D);

    Chart1->Canvas->Brush->Color = clYellow;
    Series1->DrawZone(100,300,Chart1->Width3D);

    Chart1->Canvas->Brush->Color = clRed;
    Series1->DrawZone(300,700,Chart1->Width3D);

    // Prepare Pen
    Chart1->Canvas->Pen->Color = clWhite;
    Chart1->Canvas->Pen->Width = 2;
    Chart1->Canvas->Pen->Style = psSolid;

    // Draw "ring" at 300
    Series1->DrawRing(300,Chart1->Width3D);
  }
}
//---------------------------------------------------------------------------
void __fastcall TPolarZones::CheckBox1Click(TObject *Sender)
{
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TPolarZones::FormCreate(TObject *Sender)
{
  Series1->Clear();
  Series1->AddPolar(30,100);
  Series1->AddPolar(45,150);
  Series1->AddPolar(60,-90);
  Series1->AddPolar(80,300);
  Series1->AddPolar(130,400);
  Series1->AddPolar(170,250);
  Series1->AddPolar(230,100);
  Series1->AddPolar(260,120);
  Series1->AddPolar(330,700);
}
//---------------------------------------------------------------------------

void __fastcall TPolarZones::Series1BeforeDrawValues(TObject *Sender)
{
  if (CheckBox1->Checked) DrawPolarZones();
}
//---------------------------------------------------------------------------


void __fastcall TPolarZones::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Series1->CircleGradient);
}
//---------------------------------------------------------------------------

