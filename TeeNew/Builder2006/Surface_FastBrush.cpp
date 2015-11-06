//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Surface_FastBrush.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSurfaceFastBrush *SurfaceFastBrush;
//---------------------------------------------------------------------------
__fastcall TSurfaceFastBrush::TSurfaceFastBrush(TComponent* Owner)
  : TBaseForm(Owner)
{

  LabelTime->Caption ="";

  Series1->FillSampleValues(30);

  // Speed. Disable border:
  Chart1->BevelOuter = bvNone;

  // For more speed, try disabling doublebuffer (set to False).
  Chart1->BufferedDisplay = true;

  // Speed trick, as we know Surface data will not be modified anymore:
  Series1->FillGridIndex();
  Series1->ReuseGridIndex = true;

  Series1->Pen->Hide();
  Series1->FastBrush = true;

  // other setting to increase speed:

  Chart1->Title->Hide();
  Chart1->Legend->Hide();
  Chart1->ClipPoints = false;
  Chart1->Walls->Left->Hide();

  Chart1->Axes->FastCalc = true;  // <-- bypass overflow checkings...
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceFastBrush::Button1Click(TObject *Sender)
{
  Button1->Enabled = false;
  CheckBox1->Enabled= false;
  try
  {
    DWORD StartTime = GetTickCount();
    for (int t=0; t<=360; t++)
    {
      Chart1->View3DOptions->Rotation = t;
      Chart1->Repaint();
    }

    DWORD EndTime = GetTickCount();

    LabelTime->Caption = "Time: "+FloatToStr( (EndTime-StartTime)*0.001 )+" ms";
  }
  __finally
  {
    Button1->Enabled = true;
    CheckBox1->Enabled= true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceFastBrush::CheckBox1Click(TObject *Sender)
{
  Series1->FastBrush = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceFastBrush::CheckBox2Click(TObject *Sender)
{
  Chart1->Axes->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceFastBrush::CheckBox3Click(TObject *Sender)
{
  Chart1->BufferedDisplay = CheckBox3->Checked;
}
//---------------------------------------------------------------------------

