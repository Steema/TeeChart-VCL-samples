//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tools_SeriesAnim.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSeriesAnimDemo *SeriesAnimDemo;
//---------------------------------------------------------------------------
__fastcall TSeriesAnimDemo::TSeriesAnimDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeriesAnimDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);

  // Cosmetic changes for better animation display...
  Chart1->Legend->Visible = false;
  Series1->ValueFormat = "000";
}
//---------------------------------------------------------------------------

void __fastcall TSeriesAnimDemo::ScrollBar1Change(TObject *Sender)
{
  ChartTool1->Steps = ScrollBar1->Position;
  Label2->Caption = IntToStr(ScrollBar1->Position);
}
//---------------------------------------------------------------------------

void __fastcall TSeriesAnimDemo::Button1Click(TObject *Sender)
{
  ScrollBar1->Enabled = false;
  Button1->Enabled = false;
  try
  {
    ChartTool1->Execute();  // <-- Animation !
  }
  __finally
  {
    ScrollBar1->Enabled = true;
    Button1->Enabled = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSeriesAnimDemo::Button2Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);

  // cosmetic... just in case "steps" has changed
  ScrollBar1->Position = ChartTool1->Steps;
  Label2->Caption = IntToStr(ScrollBar1->Position);

}
//---------------------------------------------------------------------------

void __fastcall TSeriesAnimDemo::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) ChartTool1->DrawEvery = 1;
  else ChartTool1->DrawEvery = 0;
}
//---------------------------------------------------------------------------

