//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Contour_SmoothSegments.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TContourSmooth *ContourSmooth;
//---------------------------------------------------------------------------
__fastcall TContourSmooth::TContourSmooth(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TContourSmooth::CheckBox1Click(TObject *Sender)
{
  Series1->Smoothing->Active = CheckBox1->Checked;
  CheckBox2->Enabled = CheckBox1->Checked;
  UpDown1->Enabled = CheckBox1->Checked;
  Edit1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TContourSmooth::CheckBox2Click(TObject *Sender)
{
  Series1->Smoothing->Interpolate = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TContourSmooth::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
}
//---------------------------------------------------------------------------

void __fastcall TContourSmooth::Edit1Change(TObject *Sender)
{
  Series1->Smoothing->Factor = UpDown1->Position;
  Series1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TContourSmooth::ChartTool1GetText(TMarksTipTool *Sender,
      AnsiString &Text)
{
  // Find level and segment under mouse cursor...

  int tmpSegment, tmpPoint;
  int tmpLevel = Series1->Levels->Clicked(Chart1->GetCursorPos().x,Chart1->GetCursorPos().y,tmpSegment,tmpPoint);

  // If mouse is over a segment line...
  if (tmpLevel!=-1)
  {
    Text = "Level: "+IntToStr(tmpLevel)+TeeLineSeparator+
          "Segment: "+IntToStr(tmpSegment)+TeeLineSeparator+
          "Point: "+IntToStr(tmpPoint);
  }
  else Text ="?";
}
//---------------------------------------------------------------------------

void __fastcall TContourSmooth::CheckBox3Click(TObject *Sender)
{
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TContourSmooth::Chart1AfterDraw(TObject *Sender)
{
  TPoint P;
  if (CheckBox3->Checked)
  {
    // Draw small points at contour level segment lines...
    Chart1->Canvas->Brush->Color = clBlack;
    Chart1->Canvas->Pen->Color = clGreen;
    TContourLevels *levels = Series1->Levels;
    for (int tmpLevel=0; tmpLevel<levels->Count; tmpLevel++) // for each level..
    {
     TContourLevel *level = levels->Items[tmpLevel];
     for (int tmpSegment = 0; tmpSegment<level->SegmentCount(); tmpSegment++) // for each segment in level...
     {
        for (int tmp=0; tmp<level->SegmentCount(); tmp++) // for each point in segment...
        {
            // Convert to screen coordinates...
            P.x = Series1->GetHorizAxis->CalcXPosValue(level->Segments[tmpSegment].Points[tmp].X);
            P.y = Series1->GetVertAxis->CalcYPosValue(level->Segments[tmpSegment].Points[tmp].Y);

            // Draw point...
            Chart1->Canvas->Rectangle(P.x-2,P.y-2,P.x+2,P.y+2);
        }
     }
    }
  }
}
//---------------------------------------------------------------------------

