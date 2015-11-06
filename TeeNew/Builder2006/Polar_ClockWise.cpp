//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Polar_ClockWise.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TPolarClockWise *PolarClockWise;
//---------------------------------------------------------------------------
__fastcall TPolarClockWise::TPolarClockWise(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPolarClockWise::CheckBox1Click(TObject *Sender)
{
  Series1->ClockWiseLabels = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPolarClockWise::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

