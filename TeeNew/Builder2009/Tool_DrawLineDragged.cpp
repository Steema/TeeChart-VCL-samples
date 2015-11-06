//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_DrawLineDragged.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TDrawLineOnDragged *DrawLineOnDragged;
//---------------------------------------------------------------------------
__fastcall TDrawLineOnDragged::TDrawLineOnDragged(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDrawLineOnDragged::FormCreate(TObject *Sender)
{
  double tmp;
  Series1->FillSampleValues(20); // random values...

  // create a new DrawLine
  TDrawLine *MyLine=new TDrawLine(ChartTool1->Lines);

  // set the "X" line positions (start and end position)
  MyLine->StartPos.X=5;
  MyLine->EndPos.X=15;

  // set the "Y" line positions (start and end position)

  // calculate 20% vertical position (for example)

  TChartValueList *YValues=Series1->YValues;
  tmp=(YValues->MaxValue-YValues->MinValue)/5.0;

  // set Y positions
  MyLine->StartPos.Y=YValues->MaxValue-tmp;
  MyLine->EndPos.Y=YValues->MinValue+tmp;

  ChartTool1->Pen->Color=clBlue;
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineOnDragged::ChartTool1DraggedLine(TObject *Sender)
{
  LabelLinePos->Caption="Start: (x: "+
       FormatFloat("#.##",ChartTool1->Selected->StartPos.X)+" y: "+
       FormatFloat("#.##",ChartTool1->Selected->StartPos.Y)+") "+
       "End: (x: "+
       FormatFloat("#.##",ChartTool1->Selected->EndPos.X)+" y: "+
       FormatFloat("#.##",ChartTool1->Selected->EndPos.Y)+
       ")";
        
}
//---------------------------------------------------------------------------

