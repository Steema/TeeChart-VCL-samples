//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FastLine_DrawAll.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFastLineDrawAll *FastLineDrawAll;
//---------------------------------------------------------------------------
__fastcall TFastLineDrawAll::TFastLineDrawAll(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFastLineDrawAll::FormCreate(TObject *Sender)
{
  const int NumPoints = 1000000;  // one million points !
  int t;
  TChartValues MyX, MyY;
  double tmp;

  // tell Series1 to draw non-repeated points only ( much faster ! )
  Series1->DrawAllPoints=false;

  // lets add one million points to Series1...


  MyX.Length=NumPoints;
  MyY.Length=NumPoints;

  tmp=random(10000);
  for (t=0; t<NumPoints; t++)
  {
    tmp=tmp+random(100)-49.5;
    MyX[t]=t;
    MyY[t]=tmp;
  }

  Series1->XValues->Count=NumPoints;
  Series1->XValues->Value=MyX;
  Series1->YValues->Count=NumPoints;
  Series1->YValues->Value=MyY;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineDrawAll::RadioButton1Click(TObject *Sender)
{
  RadioButton2->Checked=false;
  Series1->DrawAllPoints=true;
}
//---------------------------------------------------------------------------

void __fastcall TFastLineDrawAll::RadioButton2Click(TObject *Sender)
{
  RadioButton1->Checked=false;
  Series1->DrawAllPoints=false;
}
//---------------------------------------------------------------------------

