//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Depth.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma resource "*.dfm"
TSeriesDepth *SeriesDepth;
//---------------------------------------------------------------------------
__fastcall TSeriesDepth::TSeriesDepth(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeriesDepth::CheckBox1Click(TObject *Sender)
{
  int tmp;
  (CheckBox1->Checked == true) ? tmp = -1 : tmp = UpDown1->Position;

  Series1->Depth = tmp;
  Series2->Depth = tmp;
  Series3->Depth = tmp;
}
//---------------------------------------------------------------------------

void __fastcall TSeriesDepth::Edit1Change(TObject *Sender)
{
  CheckBox1->Checked = false;
  Series1->Depth =UpDown1->Position;
  Series2->Depth =UpDown1->Position;
  Series3->Depth =UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TSeriesDepth::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series2->FillSampleValues(6);
  Series3->FillSampleValues(10);
}
//---------------------------------------------------------------------------

