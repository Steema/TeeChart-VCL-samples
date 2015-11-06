//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Canvas_RotCenter.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeChartActions"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TRotationCenter *RotationCenter;
//---------------------------------------------------------------------------
__fastcall TRotationCenter::TRotationCenter(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRotationCenter::TrackBar1Change(TObject *Sender)
{
  Chart1->Canvas->RotationCenter.X = TrackBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TRotationCenter::Timer1Timer(TObject *Sender)
{
  TView3DOptions *Options = Chart1->View3DOptions;
  Options->Rotation = Options->Rotation + Delta;
  if (Options->Rotation ==360) Delta = -1;
  else if (Options->Rotation ==270) Delta =1;
}
//---------------------------------------------------------------------------

void __fastcall TRotationCenter::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  Delta = 1;
}
//---------------------------------------------------------------------------

void __fastcall TRotationCenter::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRotationCenter::TrackBar2Change(TObject *Sender)
{
  Chart1->Canvas->RotationCenter.Y = TrackBar2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TRotationCenter::TrackBar3Change(TObject *Sender)
{
  Chart1->Canvas->RotationCenter.Z = TrackBar3->Position;
}
//---------------------------------------------------------------------------

void __fastcall TRotationCenter::Chart1AfterDraw(TObject *Sender)
{
   int tmpX,tmpY,tmpZ;

   if (CheckBox2->Checked)
   {
     TCanvas3D *tmpCanvas = Chart1->Canvas;
     // set pen style
     tmpCanvas->Pen->Color = clBlue;
     tmpCanvas->Pen->Width = 1;
     tmpCanvas->Pen->Style = psDot;
     // center position
     tmpY = Chart1->ChartYCenter+ceil(tmpCanvas->RotationCenter.Y);
     tmpX =Chart1->ChartXCenter+ceil(tmpCanvas->RotationCenter.X);
     tmpZ =(Chart1->Width3D/2)+ceil(tmpCanvas->RotationCenter.Z);
     // draw axes }
     tmpCanvas->HorizLine3D( Chart1->ChartRect.Left,Chart1->ChartRect.Right,tmpY,tmpZ);
     tmpCanvas->VertLine3D( tmpX, Chart1->ChartRect.Top, Chart1->ChartRect.Bottom, tmpZ);
     tmpCanvas->ZLine3D( tmpX, tmpY, 0, Chart1->Width3D);
   }
}
//---------------------------------------------------------------------------

