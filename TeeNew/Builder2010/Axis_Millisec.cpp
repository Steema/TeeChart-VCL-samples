//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_Millisec.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisMillisec *AxisMillisec;
//---------------------------------------------------------------------------
__fastcall TAxisMillisec::TAxisMillisec(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisMillisec::FormCreate(TObject *Sender)
{
  Series1->XValues->DateTime = true;
  Series1->Clear();
  Series1->AddXY(EncodeTime(0,0,0,0), 100, "", clTeeColor);
  Series1->AddXY(EncodeTime(0,0,0,1), 200, "", clTeeColor);
  Series1->AddXY(EncodeTime(0,0,0,2), 100, "" ,clTeeColor);
  Series1->AddXY(EncodeTime(0,0,0,3), 200, "", clTeeColor);

  Chart1->BottomAxis->Increment = DateTimeStep[dtOneMillisecond];
  Chart1->BottomAxis->DateTimeFormat = "ss.zzz";
  Chart1->BottomAxis->RoundFirstLabel = false;
}
//---------------------------------------------------------------------------

