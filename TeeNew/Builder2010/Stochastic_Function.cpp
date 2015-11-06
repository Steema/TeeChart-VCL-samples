//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Stochastic_Function.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma link "StatChar"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TStochasticForm *StochasticForm;
//---------------------------------------------------------------------------
__fastcall TStochasticForm::TStochasticForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TStochasticForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(60);
}
//---------------------------------------------------------------------------

void __fastcall TStochasticForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------
void __fastcall TStochasticForm::CheckBox1Click(TObject *Sender)
{
  Series2->Active = CheckBox1->Checked;
  Chart1->Legend->Visible = CheckBox1->Checked;

  // resize the Left axis
  if (CheckBox1->Checked) Chart1->LeftAxis->EndPosition = 75;
  else Chart1->LeftAxis->EndPosition = 100;

  Edit1->Enabled = CheckBox1->Checked;
  UpDown1->Enabled = CheckBox1->Checked;

  //show / hide the color band
  ChartTool1->Active = CheckBox1->Checked;
  ChartTool2->Active =CheckBox1->Checked;
}
//---------------------------------------------------------------------------

