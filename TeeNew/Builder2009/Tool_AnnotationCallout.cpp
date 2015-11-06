//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_AnnotationCallout.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TAnnotationCO *AnnotationCO;
//---------------------------------------------------------------------------
__fastcall TAnnotationCO::TAnnotationCO(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAnnotationCO::SetCallout(int AIndex)
{
  // Change annotation text
  ChartTool1->Text = "Point: "+IntToStr(AIndex)+TeeLineSeparator+
                   "Value: "+Series1->ValueMarkText[AIndex];

  // Re-position annotation callout
  ChartTool1->Callout->Visible = true;
  ChartTool1->Callout->XPosition = Series1->CalcXPos(AIndex);
  ChartTool1->Callout->YPosition = Series1->CalcYPos(AIndex);
  ChartTool1->Callout->ZPosition = 0;
}
//---------------------------------------------------------------------------
// Returns Series point index that is nearest to xy position.
int __fastcall TAnnotationCO::NearestPoint(TChartSeries *ASeries, int x, int y)
{
  int res = -1;
  int Difference = -1;
  int tmpDif;
  for (int t=0; t<ASeries->Count(); t++)
  {
    tmpDif = int(TeeDistance(ASeries->CalcXPos(t)-x,ASeries->CalcYPos(t)-y));
    if (Difference==-1 || tmpDif<Difference)
    {
      Difference = tmpDif;
      res = t;
    }
  }
  return res;
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationCO::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  if (CheckBox1->Checked) // follow mouse
  {
    // Locate nearest point to mouse...
    int tmp = NearestPoint(Series1, X, Y);
    if (tmp!=-1) SetCallout(tmp);  // set annotation callout
  }
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationCO::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);

  // force a first-time chart redrawing, to obtain valid
  // coordinates (Series1->CalcYPos, etc).
  Chart1->Draw();

  // Start positioning annotation callout at point index 5
  SetCallout(5);

  ChartTool1->Callout->Arrow->Visible = true;

  ButtonPen1->LinkPen(ChartTool1->Callout->Arrow);
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationCO::Button1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationCO::CheckBox1Click(TObject *Sender)
{
  Chart1->Title->Text->Clear();

  if (CheckBox1->Checked)
  {
    Chart1->Title->Text->Add("Move the mouse over points !");
    Series1->Cursor = crDefault;
  }
  else
  {
    Chart1->Title->Text->Add("Click a point !");
    Series1->Cursor = crHandPoint;
  }
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationCO::Chart1ClickSeries(TCustomChart *Sender,
      TChartSeries *Series, int ValueIndex, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
  if (!CheckBox1->Checked) SetCallout(ValueIndex);
}
//---------------------------------------------------------------------------

