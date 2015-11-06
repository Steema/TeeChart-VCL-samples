//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorBand_Transparent.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TColorBandTransp *ColorBandTransp;
//---------------------------------------------------------------------------
__fastcall TColorBandTransp::TColorBandTransp(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorBandTransp::FormCreate(TObject *Sender)
{

  // random values...
  Series1->FillSampleValues(20);

  // set the color band...
  ChartTool1->Axis  = Chart1->LeftAxis;

  // display the band vertically centered
  ChartTool1->StartValue =Series1->YValues->MinValue+30;
  ChartTool1->EndValue = Series1->YValues->MaxValue-30;

  // set the transparency %
  ChartTool1->Transparency = 50;
  TrackBar1->Position = 50;

  // draw the band on top...
  ChartTool1->DrawBehind = false;

  // remove the chart grid lines
  Chart1->LeftAxis->Grid->Visible = false;
  Chart1->BottomAxis->Grid->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TColorBandTransp::TrackBar1Change(TObject *Sender)
{
  ChartTool1->Transparency = TrackBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TColorBandTransp::CheckBox1Click(TObject *Sender)
{
  ChartTool1->DrawBehind = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

