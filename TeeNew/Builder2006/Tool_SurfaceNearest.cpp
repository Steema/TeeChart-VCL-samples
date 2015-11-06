//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Tool_SurfaceNearest.h"
#include "TeeSurfaceTool.hpp"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeCanvas"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSurfaceNearestForm *SurfaceNearestForm;
//---------------------------------------------------------------------------
__fastcall TSurfaceNearestForm::TSurfaceNearestForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
// This event is called when the user moves the mouse
// over a surface's cell.
// Let's use it in this demo to show the "hit" cell row and column.
void __fastcall TSurfaceNearestForm::ToolSelect(TObject *Sender)
{
  double tmpRow, tmpCol;
  int tmp = dynamic_cast<TSurfaceNearestTool*>(Sender)->SelectedCell;
  if (tmp ==-1) Label1->Caption = "";
  else
  {
    dynamic_cast<TSurfaceNearestTool*>(Sender)->GetRowCol(tmpRow,tmpCol);
    Label1->Caption = "Row: "+FloatToStr(tmpRow)+" Column: "+FloatToStr(tmpCol);
  }
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceNearestForm::AddSurfacePoints()
{
  const int NumX = 50;
  const int NumZ = 30;

  Series1->NumXValues = NumX;
  Series1->NumZValues = NumZ;

  for (int x=1; x<=NumX; x++)
  {
    for (int z=1; z<=NumZ; z++)
    {
      Series1->AddXYZ( x,
                          cos(0.14*x)*cos(0.25*z)+
                          0.01*(x-(NumX/2))*(z-(NumZ/2)) +
                          13*exp(-0.06*(pow(x-(NumX/2),2)+pow(z-(NumZ/2),2)))+
                          6*exp(-0.03*(pow(x-(NumX/3),2)+pow(z-3*(NumZ/5),2)))-1,
                          z );
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceNearestForm::FormCreate(TObject *Sender)
{

  Chart1->Axes->FastCalc = true;
  Chart1->View3DOptions->ZoomText = ztNo;

  AddSurfacePoints();

  // Create tool  (this can also be done at design-time without any code)
  TSurfaceNearestTool *tmp = new TSurfaceNearestTool(this);
  tmp->Series = Series1;
  tmp->OnSelectCell = ToolSelect;

  Chart1->Tools->Add(tmp);
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceNearestForm::Button1Click(TObject *Sender)
{
  EditChartTool(this,Chart1->Tools->Items[0]);
}
//---------------------------------------------------------------------------

