//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "XYZ_Gridding.h"
#include "math.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePoin3"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TXYZGridding *XYZGridding;
//---------------------------------------------------------------------------
__fastcall TXYZGridding::TXYZGridding(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
TChartValue __fastcall TXYZGridding::ClosestValue(TCustom3DSeries *Source, const TChartValue X, const TChartValue Z)
{
  TChartValue res = 0.0;
  double MaxDist = 1.0E+300;
  int Closer = -1;
  TChartValue tmpX, tmpZ, dist;

  for (int t=0; t<Source->Count(); t++)
  {
    tmpX = Source->XValues->Value[t]-X;
    tmpZ = Source->ZValues->Value[t]-Z;
    dist = sqrt(pow(tmpX,2)+pow(tmpZ,2));
    if (dist<MaxDist)
    {
      MaxDist = dist;
      Closer = t;
    }
  }

  if (Closer!=-1) res = Source->YValues->Value[Closer];
  return res;

}
//---------------------------------------------------------------------------
void __fastcall TXYZGridding::Gridding(TCustom3DSeries *Source, TCustom3DGridSeries *Dest, const int GridSize)
{
  TChartValue tmpX, tmpZ;
  TChartValue tmpMinX = Source->XValues->MinValue;
  TChartValue tmpMinZ = Source->ZValues->MinValue;

  TChartValue tmpXFactor =Source->XValues->Range()/GridSize;
  TChartValue tmpZFactor = Source->ZValues->Range()/GridSize;

  Dest->Clear();
  Dest->NumXValues = GridSize;
  Dest->NumZValues = GridSize;

  // loop all grid cells
  for (int x=1; x<Dest->NumXValues; x++)
  {
      tmpX = tmpMinX+((x-1)*tmpXFactor);
      for (int z=1; z<Dest->NumZValues; z++)
      {
        tmpZ = tmpMinZ+((z-1)*tmpZFactor);
        Dest->Value[x][z] = ClosestValue(Source,tmpX,tmpZ); // calculate
      }
  }
}
//---------------------------------------------------------------------------
void __fastcall TXYZGridding::Fill(void)
{
  Series1->Clear();
  int m=50;
  double tmpX, tmpZ;
  for (int x=-m; x<m; x++)
  {
    tmpX = pow(x/30.0,2);
    for (int z=-m; z<m;z++)
    {
      tmpZ = pow(z/30.0,2);
      tmpZ = sqrt(tmpX + tmpZ);
      Series1->AddXYZ(x, 4*cos(3*tmpZ)*exp(-0.5*tmpZ), z);
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TXYZGridding::FormCreate(TObject *Sender)
{
  Fill();
  Gridding(Series1,Series2,15);
}
//---------------------------------------------------------------------------

void __fastcall TXYZGridding::RadioButton1Click(TObject *Sender)
{
  RadioButton2->Checked = false;
  RadioButton1->Checked = true;

  Series1->Visible = RadioButton1->Checked;
  Series2->Visible = RadioButton2->Checked;

}
//---------------------------------------------------------------------------

void __fastcall TXYZGridding::RadioButton2Click(TObject *Sender)
{
  RadioButton1->Checked = false;
  RadioButton2->Checked = true;

  Series1->Visible = RadioButton1->Checked;
  Series2->Visible = RadioButton2->Checked;
}
//---------------------------------------------------------------------------

