//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "Series_ValueList.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TDynArrays *DynArrays;
//---------------------------------------------------------------------------
__fastcall TDynArrays::TDynArrays(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDynArrays::Button1Click(TObject *Sender)
{
  // TChartValues
  DynamicArray<double> X;
  DynamicArray<double> Y;
  // number of points }
  int Num = StrToInt(Edit1->Text);

  // allocate our custom arrays }
  X.Length = Num;
  Y.Length = Num;

  // fill data in our custom arrays }
  X[0] = 0;
  Y[0] = random(10000);
  for (int t=1; t<Num;t++)
  {
    X[t] = t;
    Y[t] = Y[t-1]+random(101)-50;
  }

  // set our X array }
  Series1->XValues->Value =(TChartValues)(X);  // <-- the array
  Series1->XValues->Count = Num;               // <-- number of points
  Series1->XValues->Modified = true;           // <-- recalculate min and max

  // set our Y array }
  Series1->YValues->Value = (TChartValues)(Y);  // <-- the array
  Series1->YValues->Count = Num;               // <-- number of points
  Series1->YValues->Modified = true;           // <-- recalculate min and max

  Chart1->UndoZoom(); // <-- remove zoom (optional)

  // Show data
  Series1->Repaint();

}
//---------------------------------------------------------------------------

