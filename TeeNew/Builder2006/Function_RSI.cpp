//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_RSI.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "StatChar"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TRSIFunctionForm *RSIFunctionForm;
//---------------------------------------------------------------------------
__fastcall TRSIFunctionForm::TRSIFunctionForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRSIFunctionForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(50);

  // align the two charts on the left side...
  Chart1->LeftAxis->LabelsSize = 30;
  Chart2->LeftAxis->LabelsSize = 30;

  // align the bottom axis...
  Chart2->BottomAxis->SetMinMax(Series1->XValues->MinValue,Series1->XValues->MaxValue);
}
//---------------------------------------------------------------------------

void __fastcall TRSIFunctionForm::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0) TeeFunction1->Style = rsiOpenClose;
  else TeeFunction1->Style = rsiClose;
}
//---------------------------------------------------------------------------

void __fastcall TRSIFunctionForm::Edit1Change(TObject *Sender)
{
  // change the RSI "period" value (number of points)
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TRSIFunctionForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

