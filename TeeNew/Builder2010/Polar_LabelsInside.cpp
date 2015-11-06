//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Polar_LabelsInside.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TPolarLabelsInside *PolarLabelsInside;
//---------------------------------------------------------------------------
__fastcall TPolarLabelsInside::TPolarLabelsInside(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPolarLabelsInside::CheckBox1Click(TObject *Sender)
{
  Series1->CircleLabelsInside = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPolarLabelsInside::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  Series1->CircleLabelsInside = true;
}
//---------------------------------------------------------------------------

