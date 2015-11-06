//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_OnBeforeDraw.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TChartBeforeDraw *ChartBeforeDraw;
//---------------------------------------------------------------------------
__fastcall TChartBeforeDraw::TChartBeforeDraw(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartBeforeDraw::DrawTheCircle()
{
  TCanvas3D *CV = Chart1->Canvas;
  CV->Brush->Color = clYellow;
  CV->Brush->Style = bsSolid;
  CV->Pen->Color = clBlue;
  CV->Pen->Style = psDot;
  CV->Ellipse(10,10,Chart1->Width-10, Chart1->Height-10);
}
void __fastcall TChartBeforeDraw::Chart1BeforeDrawChart(TObject *Sender)
{
  if (RadioGroup1->ItemIndex == 0) DrawTheCircle();
}
//---------------------------------------------------------------------------

void __fastcall TChartBeforeDraw::Chart1BeforeDrawAxes(TObject *Sender)
{
  if (RadioGroup1->ItemIndex == 1) DrawTheCircle();
}
//---------------------------------------------------------------------------

void __fastcall TChartBeforeDraw::Chart1BeforeDrawSeries(TObject *Sender)
{
  if (RadioGroup1->ItemIndex == 2) DrawTheCircle();
}
//---------------------------------------------------------------------------

void __fastcall TChartBeforeDraw::Chart1AfterDraw(TObject *Sender)
{
  if (RadioGroup1->ItemIndex == 3) DrawTheCircle();
}
//---------------------------------------------------------------------------

void __fastcall TChartBeforeDraw::RadioGroup1Click(TObject *Sender)
{
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TChartBeforeDraw::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

