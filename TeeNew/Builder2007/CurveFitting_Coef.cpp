//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CurveFitting_Coef.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CurvFitt"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TCurveFittingCoef *CurveFittingCoef;
//---------------------------------------------------------------------------
__fastcall TCurveFittingCoef::TCurveFittingCoef(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCurveFittingCoef::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);

  // set the "shape" xy as pixels...
  Series3->XYStyle = xysPixels;

  // show the polynomial...
  ShowFunction();
}
//---------------------------------------------------------------------------
void __fastcall TCurveFittingCoef::ShowFunction(void)
{
  AnsiString tmp ="y=";
  for (int t=1; t<= TeeFunction1->PolyDegree; t++)
  {
    tmp = tmp+" ";
    if (TeeFunction1->AnswerVector[t]>=0) tmp = tmp+"+";
    tmp = tmp+FormatFloat("0.0##",TeeFunction1->AnswerVector[t])+"*x";
    if (t>1) tmp=tmp+"^"+IntToStr(t);
  }

  // show the expression
  Label2->Caption = tmp;
}
//---------------------------------------------------------------------------


void __fastcall TCurveFittingCoef::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  // convert from "X" pixels to axis...
  double tmpX = Chart1->BottomAxis->CalcPosPoint(X);

  //calculate the "Y" value for a given "X"
  double tmpY = TeeFunction1->GetCurveYValue(Series1,tmpX);

  // convert from "Y" axis to pixels...
  Y = Chart1->LeftAxis->CalcPosValue(tmpY);

  // set the "circle shape" bounds...
  Series3->X0 = X-10;
  Series3->X1 = X+10;
  Series3->Y0 = Y-10;
  Series3->Y1 = Y+10;
  Series3->Active = true;
}
//---------------------------------------------------------------------------

