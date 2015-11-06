//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Funnel.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFunnelSeriesForm *FunnelSeriesForm;
//---------------------------------------------------------------------------
__fastcall TFunnelSeriesForm::TFunnelSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFunnelSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this, Funnel);
}
//---------------------------------------------------------------------------

void __fastcall TFunnelSeriesForm::FormCreate(TObject *Sender)
{
  Funnel = new TFunnelSeries(this);
  Funnel->ParentChart = Chart1;

  Funnel->Marks->Visible = true;
  Funnel->Marks->Clip  = true;
  Funnel->Name = "Series1";

  // add some points to Funnnel/Pipeline
  Funnel->AddSegment(50,110,"1st",clTeeColor);
  Funnel->AddSegment(200,50,"2nd",clTeeColor);
  Funnel->AddSegment(100,50,"3rd",clTeeColor);
  Funnel->AddSegment(60,55,"4th",clTeeColor);

  Funnel->Recalc();
}
//---------------------------------------------------------------------------

void __fastcall TFunnelSeriesForm::Chart1ClickSeries(TCustomChart *Sender,
      TChartSeries *Series, int ValueIndex, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
  if (Series == Funnel && Button == mbLeft)
  {
    AnsiString tmpStr = "Quote = "+FormatFloat("0.000",Funnel->QuoteValues->Value[ValueIndex]) + "\n";
    tmpStr = tmpStr + "Opportunity =" +
              FormatFloat("0.000",Funnel->OpportunityValues->Value[ValueIndex]) +
              "\n";
    tmpStr = tmpStr +
              "Percentage = " +
              FormatFloat("0.00%",Funnel->OpportunityValues->Value[ValueIndex]/Funnel->QuoteValues->Value[ValueIndex]*100.0);
    ShowMessage(tmpStr);
  }
  else Chart1->CancelMouse = false; // <-- enable zoom and scroll if not

}
//---------------------------------------------------------------------------

