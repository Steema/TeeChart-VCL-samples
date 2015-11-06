/*
  This example shows the Tri-Surface Charting style of
  TeeChart Pro with OpenGL.

  The "Tri-Surface" series allows you to add 3D points
  using the AddXYZ method using floating point values and
  without having to specify a "grid" of surface cells.

  So, you are free to add points at any XYZ coordinates:

    Series1->AddXYZ( 1.23 , 4.2984, 545.22 );
    Series1->AddXYZ( -325.3 , 67.32, 65.3 );
    Series1->AddXYZ( 66.2 , 821.2, -255.11 );
    ...

  and the TriSurface series will calculate the best set of
  "triangles" that connects all 3 points forming a surface.

  The triangles are displayed using the Pen and Brush of the
  Series, and the gradient and pallete of colors are also
  available.
*/
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <math.h>
#include <stdio.h>
#include "OpenGL_TriSurface.h"
#include "TeeTriSurfEdit.hpp"
#include "TeeGLEditor.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeeOpenGL"
#pragma link "TeePoin3"
#pragma link "TeeSurfa"
#pragma link "TeeTriSurface"
#pragma resource "*.dfm"
TOpenGLTriSurface *OpenGLTriSurface;
//---------------------------------------------------------------------------
__fastcall TOpenGLTriSurface::TOpenGLTriSurface(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TOpenGLTriSurface::FormCreate(TObject *Sender)
{
  Changing = false;
  randomize();
  // Tri-Surface
  Series1->Clear();
  for (int t=1; t<30; t++) AddRandomPoint();
  Series1->UsePalette = true;
  Series1->UseColorRange = false;
  Series1->Title = "Tri-Surface";

  // Point3D series
  Series2->ColorEachPoint = true;
  Series2->DataSource = Series1;
  Series2->Pointer->VertSize = 8;
  Series2->Pointer->HorizSize = 8;
  Series2->Pointer->Style = psCircle;

  // Irregular Surface
  Series3->IrregularGrid = true;
  Series3->UsePalette = true;
  Series3->UseColorRange = false;
  Series3->Clear();
  Series3->NumXValues = 0;
  Series3->NumZValues = 0;
  for (int t=1; t<10; t++)
    for (int tt=1; tt<10; tt++)
      Series3->AddXYZ(t,(exp(1+cos(t)*tt+sin(t)*cos(tt))) ,(tt-5.0)/10.0
                        , "", clTeeColor);
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::CheckBox1Click(TObject *Sender)
{
  TeeOpenGL1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::CheckBox2Click(TObject *Sender)
{
  Series1->Pen->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::CheckBox3Click(TObject *Sender)
{
  Series1->UsePalette = CheckBox3->Checked;
  Series1->UseColorRange = !Series1->UsePalette;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::FormShow(TObject *Sender)
{
  TeeCommander1->ButtonRotate->Down = true;
}
//---------------------------------------------------------------------------
void __fastcall TOpenGLTriSurface::AddRandomPoint()
{
  // Some formula to calculate values...
  double tmpX = -0.5+random(100)/100.0;
  double tmpZ = -0.5+random(100)/100.0;
  Series1->AddXYZ( tmpX,
                    -sqrt(exp(tmpX * cos(pow(tmpX,2)))) + sin(tmpZ * tmpZ)
                    ,tmpZ,"",clTeeColor);

  UpDown1->Max = Series1->Count()-1;
}

void __fastcall TOpenGLTriSurface::Button1Click(TObject *Sender)
{
  // add one more random point to the Series
  AddRandomPoint();
  Label1->Caption = "Num.Points: "+IntToStr(Series1->Count());
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::Button2Click(TObject *Sender)
{
  // Remove one point (only when there are more than 8 points)
  if (Series1->Count() >8 )
  {
    // the Chart will repaint after deleting one point..
    Series1->Delete(random(Series1->Count()));
    UpDown1->Max = Series1->Count()-1;
  }
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::CheckBox6Click(TObject *Sender)
{
  Series1->Border->Visible = CheckBox6->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::ScrollBar1Change(TObject *Sender)
{
  if (!this->Changing)
  {
    Series1->XValues->Value[UpDown1->Position] = ScrollBar1->Position/100.0;
    Series1->Repaint();
  }
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::ScrollBar2Change(TObject *Sender)
{
  if (!this->Changing)
  {
    Series1->YValues->Value[UpDown1->Position] = ScrollBar2->Position/50.0;
    Series1->Repaint();
  }
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::ScrollBar3Change(TObject *Sender)
{
  if (!this->Changing)
  {
    Series1->ZValues->Value[UpDown1->Position] = ScrollBar3->Position/100.0;
    Series1->Repaint();
  }
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::CheckBox8Click(TObject *Sender)
{
  for (int t = 0; t<Chart1->SeriesCount(); t++)
    if (dynamic_cast<TPoint3DSeries*>(Chart1->Series[t]))
      Chart1->Series[t]->Active = CheckBox8->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::CheckBox9Click(TObject *Sender)
{
  for (int t = 0; t<Chart1->SeriesCount(); t++)
    if (dynamic_cast<TSurfaceSeries*>(Chart1->Series[t]))
      Chart1->Series[t]->Active = CheckBox8->Checked;

  if (CheckBox9->Checked)
  {
    Chart1->LeftAxis->EndPosition = 50;
    Chart1->BottomAxis->EndPosition = 50;
  }
  else
  {
    Chart1->LeftAxis->EndPosition = 100;
    Chart1->BottomAxis->EndPosition = 100;
  }
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::Edit1Change(TObject *Sender)
{
  Changing = true;
  ScrollBar1->Position = floor(100.0*Series1->XValues->Value[UpDown1->Position]);
  ScrollBar2->Position = floor(50.0*Series1->YValues->Value[UpDown1->Position]);
  ScrollBar3->Position = floor(100.0*Series1->ZValues->Value[UpDown1->Position]);
  Changing = false;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLTriSurface::Series1GetMarkText(TChartSeries *Sender,
      int ValueIndex, AnsiString &MarkText)
{
  MarkText = IntToStr(ValueIndex);
}
//---------------------------------------------------------------------------

