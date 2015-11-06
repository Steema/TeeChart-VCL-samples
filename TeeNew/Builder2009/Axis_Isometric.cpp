//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_Isometric.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TIsometricAxis *IsometricAxis;
//---------------------------------------------------------------------------
__fastcall TIsometricAxis::TIsometricAxis(TComponent* Owner)
  : TBaseForm(Owner)
{
}

void __fastcall MakeIsoAxis(TChartAxis *vertical, TChartAxis *horizontal)
{
  TCustomAxisPanel *pc = vertical->ParentChart;
  if (pc->ChartWidth > 0 && pc->ChartHeight > 0)
  {
    double xrange = horizontal->Maximum - horizontal->Minimum;
    double tmpx = xrange/(double)pc->ChartWidth;
    double XYScreen = 1.0*(GetDeviceCaps(pc->Canvas->Handle,HORZSIZE)/(double)Screen->Width)/
                  (double)(GetDeviceCaps(pc->Canvas->Handle,VERTSIZE)/(double)Screen->Height);

    double yrange = vertical->Maximum - vertical->Minimum;
    double tmpy = (yrange/(double)pc->ChartHeight)*XYScreen;

    double offset;
    if (tmpx>tmpy)
    {
      if (tmpy!=0)
      {
        offset =((yrange*tmpx/(double)tmpy)-yrange)*0.5;
        vertical->SetMinMax(vertical->Minimum-offset,vertical->Maximum+offset);
      }
    }
    else if (tmpx<tmpy)
    {
      if (tmpx!=0)
      {
        offset = ((xrange*tmpy/(double)tmpx)-xrange)*0.5;
        horizontal->SetMinMax(horizontal->Minimum-offset,horizontal->Maximum+offset);
      }
    }
  }
}

void __fastcall MakeIsoAxis(TChartSeries *Series)
{
  MakeIsoAxis(Series->GetVertAxis, Series->GetHorizAxis);
}

void __fastcall MakeIsoAxis(TCustomChart *Chart)
{
  MakeIsoAxis(Chart->Axes->Left, Chart->Axes->Bottom);
}
//---------------------------------------------------------------------------
void __fastcall TIsometricAxis::FormCreate(TObject *Sender)
{
  TChartAxis *ax = Chart1->Axes->Left;
  ax->Grid->Style = psSolid;
  ax->Grid->Color = clBlack;
  ax->Increment = 50;
  ax->LabelsSeparation = 0;

  ax = Chart1->Axes->Bottom;
  ax->Grid->Style = psSolid;
  ax->Grid->Color = clBlack;
  ax->Increment = 50;
  ax->LabelsSeparation = 0;

  Series1->Clear();
  randomize();
  for (int i=0; i<99; i++)
    Series1->AddXY(i,random(100),"", clTeeColor);
}
//---------------------------------------------------------------------------
void __fastcall TIsometricAxis::Chart1Zoom(TObject *Sender)
{
  MakeIsoAxis(Series1);
}
//---------------------------------------------------------------------------
void __fastcall TIsometricAxis::Chart1UndoZoom(TObject *Sender)
{
  MakeIsoAxis(Series1);
}
//---------------------------------------------------------------------------
void __fastcall TIsometricAxis::Button1Click(TObject *Sender)
{
  MakeIsoAxis(Series1);
}
//---------------------------------------------------------------------------
