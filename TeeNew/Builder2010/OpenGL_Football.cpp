//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#include <math.h>
#pragma hdrstop

#include "OpenGL_Football.h"
#include <TeCanvas.hpp>
#include "TeePenDlg.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeeDraw3D"
#pragma link "TeeOpenGL"
#pragma resource "*.dfm"
TOpenGLFootBall *OpenGLFootBall;
//---------------------------------------------------------------------------
__fastcall TOpenGLFootBall::TOpenGLFootBall(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall DrawPlayer(TCanvas3D *ACanvas, int X, int Y, int Z,
                TColor BodyColor, TColor ArmColor, TColor PantsColor, TColor LegsColor)
{
  /* Create some 3D objects (cube, sphere, etc) to form
     a person like a football player */

  TColor clSkin = TColor(RGB(241,226,190));

  ACanvas->Pen->Style = psClear;
  // head
  ACanvas->Brush->Color = clSkin;
  ACanvas->Sphere(X,Y-20,Z,2.5);
  // neck
  ACanvas->Cylinder(true,X-1,Y-18,X+1,Y-16,Z-1,Z+1,true);

  // eyes
  ACanvas->Brush->Color = clBlack;
  ACanvas->Sphere(X-2,Y-21,Z-1,0.5);
  ACanvas->Sphere(X-2,Y-21,Z+1,0.5);

  // body
  ACanvas->Brush->Color = BodyColor;
  ACanvas->Cube(X-2,X+2,Y-16,Y-8,Z-3,Z+3,true);

  // arms
  ACanvas->Brush->Color = ArmColor;
  ACanvas->Cylinder(true,X-1,Y-16,X+2,Y-10,Z-5,Z-3,true);
  ACanvas->Cylinder(true,X-1,Y-16,Z+2,Y-10,Z+5,Z+3,true);

  // bottom arms
  ACanvas->Brush->Color = clSkin;
  ACanvas->Cylinder(true,X-1,Y-10,X+2,Y-5,Z-5,Z-3,true);
  ACanvas->Cylinder(true,X-1,Y-10,X+2,Y-5,Z+5,Z+3,true);

  // pants
  ACanvas->Brush->Color = PantsColor;
  ACanvas->Cube(X-2,X+2,Y-8,Y-4,Z-3,Z+3,true);

  // legs
  ACanvas->Brush->Color = clSkin;
  ACanvas->Cylinder(true,X-1,Y-4,X+2,Y,Z-4,Z,true);
  ACanvas->Cylinder(true,X-1,Y-4,X+2,Y,Z+4,Z,true);

  // bottom legs
  ACanvas->Brush->Color = LegsColor;
  ACanvas->Cylinder(true,X-2,Y,X+2,Y+8,Z-3,Z,true);
  ACanvas->Cylinder(true,X-2,Y,X+2,Y+8,Z+4,Z+1,true);

  // feet
  ACanvas->Brush->Color = clBlack;
  ACanvas->Cube(X-3,X+2,Y+8,Y+10,Z-2,Z-1,true);
  ACanvas->Cube(X-3,X+2,Y+8,Y+10,Z+2,Z+1,true);
}
//---------------------------------------------------------------------------
void __fastcall DrawGateArea(TCanvas3D *ACanvas, int x1,int y, int w,int zSize)
{
  // The lines in front of gates
  ACanvas->MoveTo3D(x1,y,50-zSize);
  ACanvas->LineTo3D(x1+w,y,50-zSize);
  ACanvas->LineTo3D(x1+w,y,50+zSize);
  ACanvas->LineTo3D(x1,y,50+zSize);
}

void __fastcall DrawGate(TCanvas3D *ACanvas, int x,int y, int h, int z,int zSize)
{
  // The gate poles
  ACanvas->MoveTo3D(x,y,z-zSize);
  ACanvas->LineTo3D(x,y-h,z-zSize);
  ACanvas->LineTo3D(x,y-h,z+zSize);
  ACanvas->LineTo3D(x,y,z+zSize);
}

void __fastcall DrawGateNet(TCanvas3D *ACanvas, int x, int xSize, int y)
{
  // The plastic net
  ACanvas->Pen->Style = psDot;
  for (int t=-9; t<=9; t++)
  {
    ACanvas->MoveTo3D(x,y-18,50+floor(2.1*t));
    ACanvas->LineTo3D(x-xSize,y-12,50+2*t);
  }
  for (int t=-9; t<=9; t++)
  {
    ACanvas->MoveTo3D(x-xSize,y-12,50+2*t);
    ACanvas->LineTo3D(x-xSize,y,50+2*t);
  }
  for (int t=0; t<=6; t++)
  {
    ACanvas->MoveTo3D(x,y-floor(2.2*t),50+20);
    ACanvas->LineTo3D(x-xSize,y-2*t,50+18);
    ACanvas->LineTo3D(x-xSize,y-2*t,50-18);
    ACanvas->LineTo3D(x,y-floor(2.2*t),50-20);
  }
  ACanvas->Pen->Style = psSolid;
}

void __fastcall DrawArc(TCanvas3D *ACanvas, int x, int y, int z,
                int Radius, int MinAngle, int MaxAngle)
{
  // Generic method to draw a portion of a circle
  long double s,c;
  for (int t=MinAngle; t<=MaxAngle; t++)
  {
    Math::SinCos(t*M_PI/18.0,s,c);
    if (t == MinAngle) ACanvas->MoveTo3D(x-floor(double(Radius)*s),y,z+floor(double(Radius)*c));
    else ACanvas->LineTo3D(x-floor(double(Radius)*s),y,z+floor(double(Radius)*c));
  }
}

void __fastcall DrawCorner(TCanvas3D *ACanvas, int x, int y, int z, int MinAngle, int MaxAngle)
{
 // The football corners
 DrawArc(ACanvas,x,y,z,12,MinAngle,MaxAngle);
}

void __fastcall DrawSeats(TCanvas3D *ACanvas, int y, int tmp, const int W)
{
 // Draw an stair to simulate a building with many rows of seats
 int z;
 ACanvas->Pen->Style = psClear;
 int x1 = tmp-W+12;
 int x2 = tmp+W-12;
 y +=6;
 for (int t=1; t<=10; t++)
 {
   z = 200+16*(t-1);
   ACanvas->Brush->Color = TColor(RGB(0xB0,0x60,0x70));
   ACanvas->RectangleWithZ(Classes::Rect(x1,y,x2,y-6),z);
   ACanvas->Brush->Color = TColor(RGB(0x70,0x70,0xB0));
   ACanvas->RectangleY(x1,y-6,x2,z,z+16);
   y -= 6;
 }
}

void __fastcall DrawPlayer1(TCanvas3D *ACanvas, int x, int y, int z)
{
  DrawPlayer(ACanvas,x,y,z, clNavy,clBlue,clMaroon,TColor(RGB(231,116,118)));
}

void __fastcall DrawPlayer2(TCanvas3D *ACanvas, int x, int y, int z)
{
  DrawPlayer(ACanvas,x,y,z, clWhite,clLime,clRed,clYellow);
}

void __fastcall TOpenGLFootBall::Draw3D1Paint(TObject *Sender,
      const TRect &ARect)
{
  int R = 40;
  // green color
  TCanvas3D *c = Draw3D1->Canvas;
  c->Brush->Color = FGreen;
  c->Pen->Color = TColor(RGB(0x0,0x80,0x0));

  // bottom base
  int tmp = Draw3D1->ChartXCenter;
  c->Cube(tmp-230,tmp+230,Draw3D1->ChartYCenter-2,Draw3D1->ChartYCenter+4,-100,200,false);

  // bottom carpet
  int y = Draw3D1->ChartYCenter-8;

  // light gray color to draw lines
  c->Pen->Style = psSolid;
  c->Pen->Color = FLines;
  c->Brush->Style = bsClear;

  // big rectangle
  c->RectangleY(tmp-W+20,y,tmp+W-20,-80,180);

  // center line
  c->MoveTo3D(tmp,y,-80);
  c->LineTo3D(tmp,y,180);

  // middle circle }
  DrawArc(c,tmp,y,50,R,0,36);

  // left gate area lines
  DrawGateArea(c,tmp-W+20,y,60,70);
  DrawArc(c,tmp-W+20+35,y,50,40,22,32);
  DrawGateArea(c,tmp-W+20,y,20,30);
  //  left gate and net
  DrawGate(c,tmp-W+20,y,18,50,20);
  DrawGate(c,tmp-W+10,y,12,50,18);
  DrawGateNet(c,tmp-W+20,10,y);

  // right gate area lines
  DrawGateArea(c,tmp+W-20,y,-60,70);
  DrawArc(c,tmp+W-20-35,y,50,40,4,14);
  DrawGateArea(c,tmp+W-20,y,-20,30);

  // right gate and net
  DrawGate(c,tmp+W-20,y,18,50,20);
  DrawGate(c,tmp+W-10,y,12,50,18);
  DrawGateNet(c,tmp+W-20,-10,y);

  // the four corners
  DrawCorner(c,tmp-W+20,y,-80,27,36);
  DrawCorner(c,tmp+W-20,y,-80,0,9);
  DrawCorner(c,tmp-W+20,y,180,18,27);
  DrawCorner(c,tmp+W-20,y,180,9,18);

  // the two penalties and center point
  DrawArc(c,tmp-W+20+45,y,50,1,0,36);
  DrawArc(c,tmp+W-20-45,y,50,1,0,36);
  DrawArc(c,tmp,y,50,1,0,36);

  // the ball
  c->Brush->Color = FBall;
  c->Sphere(Draw3D1->ChartXCenter+Ball.x,y-TrackBar1->Position+1,50+Ball.y,TrackBar1->Position);

  // the back public seats
  if (CheckBox2->Checked) DrawSeats(c,y,tmp,W);
   // Draw players
  if (CheckBox3->Checked)
  {
    y = Draw3D1->ChartYCenter-17;
    for (int t=0;t<5;t++)
    {
      if (t>=4) DrawPlayer2(c,Draw3D1->ChartXCenter+Players[t].x,y,50+Players[t].y);
      else DrawPlayer1(c,Draw3D1->ChartXCenter+Players[t].x,y,50+Players[t].y);
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::FormCreate(TObject *Sender)
{
  // default button in toolbar: rotate field
  TeeCommander1->ButtonRotate->Down = true;

  // initialize constants
  W = 210;
  D = 100;
  Ball.x = -20;
  Ball.y = 20;
  for (int t=0; t<5; t++)
  {
    Players[t].x = random(200)-100;
    Players[t].y = random(100)-50;
    DeltaPlayers[t].x = 0;
    DeltaPlayers[t].y = 0;
  }
  DeltaBall.x = 2;
  DeltaBall.y = 3;
  DeltaZoom = 2;

  // colors

  FGreen = TColor(RGB(0x0,0x90,0x0));
  FLines = TColor(RGB(0xB0,0xB0,0xB0));
  FBall = TColor(RGB(0xB0,0xB0,0xB0));
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::Button1Click(TObject *Sender)
{
  Draw3D1->Color = EditColor(this,Draw3D1->Color);
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::Button2Click(TObject *Sender)
{
  FGreen = EditColor(this,FGreen);
  Draw3D1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::CheckBox2Click(TObject *Sender)
{
  Draw3D1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::Button3Click(TObject *Sender)
{
  FLines = EditColor(this,FLines);
  Draw3D1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::Button4Click(TObject *Sender)
{
  FBall = EditColor(this,FBall);
  Draw3D1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::TrackBar2Change(TObject *Sender)
{
  Draw3D1->View3DOptions->Perspective = TrackBar2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::TrackBar3Change(TObject *Sender)
{
  TeeOpenGL1->Light->Position->X = TrackBar3->Position;
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLFootBall::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

  // Apply X and Y "deltas" to APoint
  void MovePoint(TPoint &APoint, TPoint &ADelta, int W, int D)
  {
      APoint.x += ADelta.x;
      if (APoint.x < -W || APoint.x > W) ADelta.x = - ADelta.x;
      APoint.y += ADelta.y;
      if (APoint.y < -D || APoint.y > D) ADelta.y = - ADelta.y;
  }
void __fastcall TOpenGLFootBall::Timer1Timer(TObject *Sender)
{
  // move the ball...
  MovePoint(Ball,DeltaBall,W,D);

  // move the players...
  for (int t=0; t<5; t++)
  {
    if (random(100)<5) // stop it
    {
      DeltaPlayers[t].x = 0;
      DeltaPlayers[t].y = 0;
    }
    else // move it
    {
      if (DeltaPlayers[t].x == 0)
      {
        if (random(100)<10) DeltaPlayers[t].x = 2;
        else if (random(100)<10) DeltaPlayers[t].x = -2;
      }

      if (DeltaPlayers[t].y == 0)
      {
        if (random(100)<10) DeltaPlayers[t].y = 2;
        else if (random(100)<10) DeltaPlayers[t].y = -2;
      }

      MovePoint(Players[t],DeltaPlayers[t], W, D);
    }
  }

  // rotate the field...
  if (CheckBox1->Checked)
  {
    TView3DOptions *opt = Draw3D1->View3DOptions;
    opt->Rotation += 1;
    opt->Zoom += DeltaZoom;
    if (opt->Zoom<60 || opt->Zoom>500) DeltaZoom = -DeltaZoom;
  }

  // show changes...
  Draw3D1->Repaint();
}
//---------------------------------------------------------------------------

