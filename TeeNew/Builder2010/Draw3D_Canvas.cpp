//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "Draw3D_Canvas.h"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeeDraw3D"
#pragma link "TeeOpenGL"
#pragma resource "*.dfm"
TDraw3DCanvas *Draw3DCanvas;
//---------------------------------------------------------------------------
__fastcall TDraw3DCanvas::TDraw3DCanvas(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
TColor RandomColor(void)
{
  TColor Res;
  // This small function returns a random color
  switch (random(8))
  {
    case 0: Res = clRed; break;
    case 1: Res = clYellow; break;
    case 2: Res = clGreen; break;
    case 3: Res = clBlue; break;
    case 4: Res = clNavy; break;
    case 5: Res = clAqua; break;
    case 6: Res = clLime; break;
    default : Res = clWhite;
  }
  return Res;
}

void __fastcall TDraw3DCanvas::Draw3D1Paint(TObject *Sender,
      const TRect &ARect)
{
  int tmpX, tmpY;
  TPoint FourPoints[4];
  // We should use this event to "Paint" shapes onto a Draw3D
  //  component Canvas.

  // We can for example, use the "Center" position in the 3D space

  int CenterX = Draw3D1->ChartXCenter;
  int CenterY = Draw3D1->ChartYCenter;
  int CenterZ = 0;

  // Determine if draw dark shape shadows or not
  bool WithShadows = CheckBox1->Checked;

  // Using the Canvas, let's draw some shapes...
  TCanvas3D *c = Draw3D1->Canvas;
    // Draw a "room". Notice only 2D drawing methods are used here
    if (CheckBoxDrawRoom->Checked && !TeeOpenGL1->Active)
    {
      // use a gradient to simulate a "room" ...
      if (CheckBoxGradient->Checked) c->GradientFill(Draw3D1->ChartBounds,clWhite,clGray,gdFromCenter);
      else
      // or use polygons...
      {
        c->Pen->Style = psSolid;
        c->Pen->Color = clBlack;
        c->Brush->Color = clWhite;
        TRect R = Draw3D1->ChartBounds;
        tmpX = (R.Right-R.Left)/4;
        tmpY = (R.Bottom-R.Top)/4;
        FourPoints[0] = Point(R.Left,R.Bottom);
        FourPoints[1] = Point(R.Left,R.Top);
        FourPoints[2] = Point(R.Left+tmpX,R.Top+tmpY);
        FourPoints[3] = Point(R.Left+tmpX,R.Bottom-tmpY);
        c->Polygon(FourPoints,3);
        FourPoints[0] = Point(R.Right,R.Bottom);
        FourPoints[1] = Point(R.Right,R.Top);
        FourPoints[2] = Point(R.Right-tmpX,R.Top+tmpY);
        FourPoints[3] = Point(R.Right-tmpX,R.Bottom-tmpY);

        c->Polygon(FourPoints,3);
        c->Brush->Color = clGray;
        c->Rectangle(R.Left+tmpX,R.Top+tmpY,R.Right-tmpX,R.Bottom-tmpY);
      }
    }

    if (CheckBoxDrawAxes->Checked)
    {
      // Draw the "axis"
      c->Pen->Color = clNavy;
      c->Pen->Style = psDot;
      c->BackMode = cbmTransparent;
      c->VertLine3D(CenterX,CenterY-150,CenterY+150,CenterZ);
      c->HorizLine3D(CenterX-150,CenterX+150,CenterY,CenterZ);
      c->ZLine3D(CenterX,CenterY,CenterZ-150,CenterZ+150);
    }

    // Draw 100 small random dots, to simulate "dust"
    for (int t=0; t<101; t++)
        c->Pixels3D[200+random(50)][120+random(100)][20+random(100)] = RandomColor();

    // Draw several shapes, planes, pyramids, cubes, etc
    c->Pen->Color = clBlack;
    c->Pen->Style = psSolid;

    c->Brush->Color = clAqua;
    c->Plane3D(Point(5,200),Point(90,240), -10,30);

    c->Brush->Color = clYellow;
    c->Pyramid(false,5,150,130,200,5,30,WithShadows);

    c->Brush->Color = clWhite;
    c->Cube(5,80,80,120,5,30,WithShadows);

    c->Brush->Color = clLime;
    c->Cylinder(false,150,50,190,200,5,50,WithShadows);

    // Draw a 3D cone
    c->Pen->Width = 1;
    c->Pen->Color = clBlue;
    c->Brush->Color = clWhite;
    c->Cone(true,CenterX-50,20,CenterX,50,20,80,WithShadows,0);

    c->Brush->Color = clRed;
    c->EllipseWithZ(40,100,80,140,-20);

    c->Brush->Color = clBlue;
    c->Pen->Color = clYellow;
    c->Cube(CenterX+130,CenterX+170,120,190,70,100,WithShadows);

    c->Brush->Color = clRed;
    c->Pen->Color = clWhite;
    c->Cube(CenterX+30,CenterX+70,120,190,70,100,WithShadows);

    c->Brush->Color = clRed;
    c->Pen->Color = clYellow;
    c->Cube(CenterX+130,CenterX+170,120,190,10,30,WithShadows);

    c->Brush->Color = clBlue;
    c->Pen->Color = clWhite;
    c->Cube(CenterX+30,CenterX+70,120,190,10,30,WithShadows);

    c->Pen->Style = psClear;
    c->Brush->Color = clRed;
    c->Cylinder(false,CenterX+30,70,CenterX+170,100,70,100,WithShadows);
    c->Cylinder(false,CenterX+30,70,CenterX+170,100,10,40,WithShadows);
    c->Pen->Style = psSolid;

    // Draw a pyramid on top of the cylinder
    c->Brush->Color = clWhite;
    c->Pen->Color = clSilver;
    c->Pyramid(true,CenterX+30,40,CenterX+170,60,10,100,WithShadows);

    // Draw a black line on top of the pyramid
    c->Pen->Color = clBlack;
    c->Pen->Width = 2;
    c->MoveTo3D( CenterX+100, 40, 45 );
    c->LineTo3D( CenterX+100, 20, 45 );

    // Draw text at 3D xyz position, on top of the previous line
    c->Font->Color = clBlack;
    c->TextAlign = TA_CENTER;
    c->BackMode = cbmTransparent;
    c->TextOut3D(CenterX+100,0,45,"Hello!");
}
//---------------------------------------------------------------------------

void __fastcall TDraw3DCanvas::FormCreate(TObject *Sender)
{
  // "" Disable "ortho" perspective. We want full 3D
  Draw3D1->View3DOptions->Orthogonal = false;

  // Hide the toolbar "normal" button
  TeeCommander1->ButtonNormal->Visible = false;

  // ...and select the "rotate" button
  TeeCommander1->ButtonRotate->Down = true;

  // Nice rotation parameters..
  Draw3D1->View3DOptions->Rotation = 330;
  Draw3D1->View3DOptions->Elevation = 325;
}
//---------------------------------------------------------------------------

void __fastcall TDraw3DCanvas::CheckBoxDrawAxesClick(TObject *Sender)
{
  Draw3D1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TDraw3DCanvas::CheckBoxDrawRoomClick(TObject *Sender)
{
  Draw3D1->Repaint();
  CheckBoxGradient->Enabled = CheckBoxDrawRoom->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDraw3DCanvas::CheckBox1Click(TObject *Sender)
{
  Draw3D1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TDraw3DCanvas::CheckBoxGradientClick(TObject *Sender)
{
  Draw3D1->Repaint();
        
}
//---------------------------------------------------------------------------

void __fastcall TDraw3DCanvas::CheckBox2Click(TObject *Sender)
{
  TeeOpenGL1->Active = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

