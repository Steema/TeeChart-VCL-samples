//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_CustomPos.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_CustomPos"
#pragma resource "*.dfm"
TLegendCustomPos *LegendCustomPos;
//---------------------------------------------------------------------------
__fastcall TLegendCustomPos::TLegendCustomPos(TComponent* Owner)
        : TBaseCustomPos(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendCustomPos::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->CustomPosition = CheckBox1->Checked;

  TrackBar1->Enabled = CheckBox1->Checked;
  TrackBar2->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLegendCustomPos::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(7);

  Chart1->Legend->CustomPosition =true;
  Chart1->Legend->Left = 36;
  Chart1->Legend->Top = 20;

  TrackBar1->Position = Chart1->Legend->Left;
  TrackBar2->Position = Chart1->Legend->Top;
}
//---------------------------------------------------------------------------

void __fastcall TLegendCustomPos::TrackBar1Change(TObject *Sender)
{
  Chart1->Legend->Left = TrackBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TLegendCustomPos::TrackBar2Change(TObject *Sender)
{
  Chart1->Legend->Top = TrackBar2->Position;
}
//---------------------------------------------------------------------------

