//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Area_Transparency.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAreaTransparency *AreaTransparency;
//---------------------------------------------------------------------------
__fastcall TAreaTransparency::TAreaTransparency(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAreaTransparency::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  Series2->FillSampleValues(20);
  Series3->FillSampleValues(20);

  Series1->Transparency=35;
  Series2->Transparency=35;
  Series3->Transparency=35;
}
//---------------------------------------------------------------------------

void __fastcall TAreaTransparency::TrackBar1Change(TObject *Sender)
{
  Series1->Transparency=TrackBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TAreaTransparency::TrackBar2Change(TObject *Sender)
{
  Series2->Transparency=TrackBar2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TAreaTransparency::TrackBar3Change(TObject *Sender)
{
  Series3->Transparency=TrackBar3->Position;
}
//---------------------------------------------------------------------------

void __fastcall TAreaTransparency::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    Series1->Transparency=TrackBar1->Position;
    Series2->Transparency=TrackBar2->Position;
    Series3->Transparency=TrackBar3->Position;
  }
  else
  {
    Series1->Transparency=0;
    Series2->Transparency=0;
    Series3->Transparency=0;
  }
}
//---------------------------------------------------------------------------

