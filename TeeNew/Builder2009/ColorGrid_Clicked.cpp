//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorGrid_Clicked.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "Math"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TColorGridClicked *ColorGridClicked;
//---------------------------------------------------------------------------
__fastcall TColorGridClicked::TColorGridClicked(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorGridClicked::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
}
//---------------------------------------------------------------------------

void __fastcall TColorGridClicked::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  int tmp=Series1->Clicked(X,Y);
  if (tmp==-1)
     LabelCell->Caption="";
  else
     LabelCell->Caption="x:"+IntToStr(int(Series1->XValues->Value[tmp]))+" "+
                        "z:"+IntToStr(int(Series1->ZValues->Value[tmp]))+
                        " Value is: "+FloatToStr(Series1->YValues->Value[tmp]);
}
//---------------------------------------------------------------------------

