//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_OrthoAngle.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TOrthoAngle *OrthoAngle;
//---------------------------------------------------------------------------
__fastcall TOrthoAngle::TOrthoAngle(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TOrthoAngle::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TOrthoAngle::TrackBar1Change(TObject *Sender)
{
  Chart1->View3DOptions->OrthoAngle=TrackBar1->Position;
  Label2->Caption=IntToStr(TrackBar1->Position);
}
//---------------------------------------------------------------------------

