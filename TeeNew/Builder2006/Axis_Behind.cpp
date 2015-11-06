//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_Behind.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisBehind *AxisBehind;
//---------------------------------------------------------------------------
__fastcall TAxisBehind::TAxisBehind(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisBehind::CheckBox1Click(TObject *Sender)
{
  Chart1->AxisBehind = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxisBehind::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Chart1->LeftAxis->Grid->Color = clWhite;
  Chart1->BottomAxis->Grid->Color = clBlue;
}
//---------------------------------------------------------------------------

