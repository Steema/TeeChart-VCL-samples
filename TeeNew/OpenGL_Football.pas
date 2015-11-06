unit OpenGL_Football;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  {$IFDEF D9}
  Types,
  {$ENDIF}
  TeeProcs, TeCanvas, TeeOpenGL, TeeComma, TeeDraw3D;

{ Show 5 football players... }
Const NumPlayers=5;

type
  TOpenGLFootBall = class(TForm)
    Draw3D1: TDraw3D;
    TeeCommander1: TTeeCommander;
    Timer1: TTimer;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox2: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Label3: TLabel;
    CheckBox3: TCheckBox;
    CheckBox1: TCheckBox;
    TeeOpenGL1: TTeeOpenGL;
    Button5: TButton;
    procedure Draw3D1Paint(Sender: TObject; const Rect: TRect);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    DeltaBall,Ball:TPoint;  { coordinates of the ball }

    Players,DeltaPlayers:Array[1..NumPlayers] of TPoint;

    W,D,DeltaZoom : Integer;

    { colors }
    FBall, FLines, FGreen, FGatePoles : TColor;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses Math, TeePenDlg, TeeGLEditor;

{ Create some 3D objects (cube, sphere, etc) to form
  a person like a football player }

Procedure DrawPlayer(ACanvas:TCanvas3D; x,y,z:Integer;
                    BodyColor,ArmColor,PantsColor,LegsColor:TColor);
var clSkin:TColor;
begin
 clSkin:=RGB(241,226,190);

 With ACanvas do
 begin
   Pen.Style:=psClear;

   { head }
   Brush.Color:=clSkin;
   Sphere(x,y-20,z,2.5);

   { neck }
   Cylinder(True,x-1,y-18,x+1,y-16,z-1,z+1,True);

   { eyes }
   Brush.Color:=clBlack;
   Sphere(x-2,y-21,z-1,0.5);
   Sphere(x-2,y-21,z+1,0.5);

   { body }
   Brush.Color:=BodyColor;
   Cube(x-2,x+2,y-16,y-8,z-3,z+3,True);

   { arms }
   Brush.Color:=ArmColor;
   Cylinder(True,x-1,y-16,x+2,y-10,z-5,z-3,True);
   Cylinder(True,x-1,y-16,x+2,y-10,z+5,z+3,True);

   { bottom arms }
   Brush.Color:=clSkin;
   Cylinder(True,x-1,y-10,x+2,y-5,z-5,z-3,True);
   Cylinder(True,x-1,y-10,x+2,y-5,z+5,z+3,True);

   { pants }
   Brush.Color:=PantsColor;
   Cube(x-2,x+2,y-8,y-4,z-3,z+3,True);

   { legs }
   Brush.Color:=clSkin;
   Cylinder(True,x-1,y-4,x+2,y,z-4,z,True);
   Cylinder(True,x-1,y-4,x+2,y,z+4,z,True);

   { bottom legs }
   Brush.Color:=LegsColor;
   Cylinder(True,x-2,y,x+2,y+8,z-3,z,True);
   Cylinder(True,x-2,y,x+2,y+8,z+4,z+1,True);

   { feet }
   Brush.Color:=clBlack;
   Cube(x-3,x+2,y+8,y+10,z-2,z-1,True);
   Cube(x-3,x+2,y+8,y+10,z+2,z+1,True);
 end;
end;

procedure TOpenGLFootBall.Draw3D1Paint(Sender: TObject; const Rect: TRect);
var y:Integer;

 { The lines in front of gates }
 Procedure DrawGateArea(x1,w,zSize:Integer);
 begin
   With Draw3D1,Canvas do
   begin
     MoveTo3D(x1,y,50-zSize);
     LineTo3D(x1+w,y,50-zSize);
     LineTo3D(x1+w,y,50+zSize);
     LineTo3D(x1,y,50+zSize);
   end;
 end;

 { The gate poles }
 Procedure DrawGate(x,h,z,zSize:Integer);
 begin
   With Draw3D1,Canvas do
   begin
     MoveTo3D(x,y,z-zSize);
     LineTo3D(x,y-h,z-zSize);
     LineTo3D(x,y-h,z+zSize);
     LineTo3D(x,y,z+zSize);
   end;
 end;

 { The plastic net }
 Procedure DrawGateNet(x,xSize:Integer);
 var t:Integer;
 begin
   With Draw3D1,Canvas do
   begin
     Pen.Style:=psDot;
     for t:=-9 to 9 do
     begin
       MoveTo3D(x,y-18,50+Round(2.1*t));
       LineTo3D(x-xSize,y-12,50+2*t);
     end;
     for t:=-9 to 9 do
     begin
       MoveTo3D(x-xSize,y-12,50+2*t);
       LineTo3D(x-xSize,y,50+2*t);
     end;
     for t:=0 to 6 do
     begin
       MoveTo3D(x,y-Round(2.2*t),50+20);
       LineTo3D(x-xSize,y-2*t,50+18);
       LineTo3D(x-xSize,y-2*t,50-18);
       LineTo3D(x,y-Round(2.2*t),50-20);
     end;
     Pen.Style:=psSolid;
   end;
 end;

 { Generic method to draw a portion of a circle }
 Procedure DrawArc(x,z,Radius,MinAngle,MaxAngle:Integer);
 var t:Integer;
     s,c:Extended;
 begin
   With Draw3D1,Canvas do
   for t:=MinAngle to MaxAngle do
   begin
     SinCos(t*pi/18.0,s,c);
     if t=MinAngle then MoveTo3D(x-Round(Radius*s),y,z+Round(Radius*c))
                   else LineTo3D(x-Round(Radius*s),y,z+Round(Radius*c));
   end;
 end;

 { The football corners }
 Procedure DrawCorner(x,z,MinAngle,MaxAngle:Integer);
 begin
   DrawArc(x,z,12,MinAngle,MaxAngle);
 end;

 { Draw an stair to simulate a building with many rows of seats }
 Procedure DrawSeats(tmp:Integer);
 var x1,x2,t,z:Integer;
 begin
   With Draw3D1.Canvas do
   begin
     Pen.Style:=psClear;
     x1:=tmp-W+12;
     x2:=tmp+W-12;
     y:=y+6;
     for t:=1 to 10 do
     begin
       z:=200+16*(t-1);
       Brush.Color:=RGB($B0,$60,$70);
       RectangleWithZ(TeeRect(x1,y,x2,y-6),z);
       Brush.Color:=RGB($70,$70,$B0);
       RectangleY(x1,y-6,x2,z,z+16);
       y:=y-6;
     end;
   end;
 end;

 Procedure DrawPlayer1(x,y,z:Integer);
 begin
   DrawPlayer(Draw3D1.Canvas as TCanvas3D,x,y,z,
              clNavy,clBlue,clMaroon,RGB(231,116,118));
 end;

 Procedure DrawPlayer2(x,y,z:Integer);
 begin
   DrawPlayer(Draw3D1.Canvas as TCanvas3D,x,y,z,
              clWhite,clLime,clRed,clYellow);
 end;

var r,t,tmp:Integer;
begin
  R:=40;
  With Draw3D1,Canvas do
  begin
    { green color }
    Brush.Color:=FGreen;
    Pen.Color:=RGB(0,$80,0);

    { bottom base }
    tmp:=ChartXCenter;
    Cube(tmp-230,tmp+230,ChartYCenter-2,ChartYCenter+4,-100,200,False);

    { bottom carpet }
    y:=ChartYCenter-8;

    { light gray color to draw lines }
    Pen.Style:=psSolid;
    Pen.Color:=FLines;

    Brush.Style:=bsClear;

    { big rectangle }
    RectangleY(tmp-W+20,y,tmp+W-20,-80,180);

    { center line }
    MoveTo3D(tmp,y,-80);
    LineTo3D(tmp,y,180);

    { middle circle }
    DrawArc(tmp,50,R,0,36);

    { left gate area lines }
    DrawGateArea(tmp-W+20,60,70);
    DrawArc(tmp-W+20+35,50,40,22,32);
    DrawGateArea(tmp-W+20,20,30);

    { left gate and net }
    Pen.Color:=FGatePoles;
    DrawGate(tmp-W+20,18,50,20);

    Pen.Color:=FLines;
    DrawGate(tmp-W+10,12,50,18);
    DrawGateNet(tmp-W+20,10);

    { right gate area lines }
    DrawGateArea(tmp+W-20,-60,70);
    DrawArc(tmp+W-20-35,50,40,4,14);
    DrawGateArea(tmp+W-20,-20,30);

    { right gate and net }
    Pen.Color:=FGatePoles;
    DrawGate(tmp+W-20,18,50,20);

    Pen.Color:=FLines;
    DrawGate(tmp+W-10,12,50,18);
    DrawGateNet(tmp+W-20,-10);

    { the four corners }
    DrawCorner(tmp-W+20,-80,27,36);
    DrawCorner(tmp+W-20,-80,0,9);
    DrawCorner(tmp-W+20,180,18,27);
    DrawCorner(tmp+W-20,180,9,18);

    { the two penalties and center point }
    DrawArc(tmp-W+20+45,50,1,0,36);
    DrawArc(tmp+W-20-45,50,1,0,36);
    DrawArc(tmp,50,1,0,36);

    { the ball }
    Brush.Color:=FBall;
    Sphere(ChartXCenter+Ball.X,y-TrackBar1.Position+1,50+Ball.Y,TrackBar1.Position);

    { the back public seats }
    if CheckBox2.Checked then DrawSeats(tmp);

    { Draw players }
    if CheckBox3.Checked then
    begin
      y:=ChartYCenter-17;
      for t:=1 to NumPlayers do
        if t>=NumPlayers-1 then
           DrawPlayer2(ChartXCenter+Players[t].X,y,50+Players[t].Y)
        else
           DrawPlayer1(ChartXCenter+Players[t].X,y,50+Players[t].Y);
    end;
  end;
end;

procedure TOpenGLFootBall.FormCreate(Sender: TObject);
var t:Integer;
begin
  { default button in toolbar: rotate field }
  TeeCommander1.ButtonRotate.Down:=True;

  { initialize constants }
  W:=210;
  D:=100;
  Ball.X:=-20;
  Ball.Y:=20;
  for t:=1 to NumPlayers do
  begin
    Players[t].X:=Random(200)-100;
    Players[t].Y:=Random(100)-50;
    DeltaPlayers[t].X:=0;
    DeltaPlayers[t].Y:=0;
  end;
  DeltaBall.X:=2;
  DeltaBall.Y:=3;
  DeltaZoom:=2;

  { colors }
  FGreen:=RGB(0,$90,0);
  FLines:=RGB($E0,$E0,$E0);
  FBall:=RGB($B0,$B0,$B0);
  FGatePoles:=clBlack;
end;

procedure TOpenGLFootBall.Timer1Timer(Sender: TObject);

  { Apply X and Y "deltas" to APoint }
  Procedure MovePoint(Var APoint,ADelta:TPoint);
  begin
    With APoint do
    begin
      Inc(X,ADelta.X);
      if (X<-W) or (X>W) then ADelta.X:=-ADelta.X;
      Inc(Y,ADelta.Y);
      if (Y<-D) or (Y>D) then ADelta.Y:=-ADelta.Y;
    end;
  end;

var t:Integer;
begin
  { move the ball... }
  MovePoint(Ball,DeltaBall);

  { move the players... }
  for t:=1 to NumPlayers do
  begin
    if Random(100)<5 then  { stop it }
    begin
      DeltaPlayers[t].X:=0;
      DeltaPlayers[t].Y:=0;
    end
    else
    begin  { move it }
      if DeltaPlayers[t].X=0 then
         if Random(100)<10 then DeltaPlayers[t].X:=2 else
         if Random(100)<10 then DeltaPlayers[t].X:=-2;
      if DeltaPlayers[t].Y=0 then
         if Random(100)<10 then DeltaPlayers[t].Y:=2 else
         if Random(100)<10 then DeltaPlayers[t].Y:=-2;
      MovePoint(Players[t],DeltaPlayers[t]);
    end;
  end;

  { rotate the field... }
  if CheckBox1.Checked then
  begin
    With Draw3D1.View3DOptions do
    begin
      Rotation:=Rotation+1;
      Zoom:=Zoom+DeltaZoom;
      if (Zoom<60) or (Zoom>500) then DeltaZoom:=-DeltaZoom;
    end;
  end;

  { show changes... }
  Draw3D1.Repaint;
end;

procedure TOpenGLFootBall.Button1Click(Sender: TObject);
begin
  With Draw3D1 do Color:=EditColor(Self,Color);
end;

procedure TOpenGLFootBall.Button2Click(Sender: TObject);
begin
  FGreen:=EditColor(Self,FGreen);
  Draw3D1.Repaint;
end;

procedure TOpenGLFootBall.CheckBox2Click(Sender: TObject);
begin
  Draw3D1.Repaint;
end;

procedure TOpenGLFootBall.Button3Click(Sender: TObject);
begin
  FLines:=EditColor(Self,FLines);
  Draw3D1.Repaint;
end;

procedure TOpenGLFootBall.Button4Click(Sender: TObject);
begin
  FBall:=EditColor(Self,FBall);
  Draw3D1.Repaint;
end;

procedure TOpenGLFootBall.TrackBar2Change(Sender: TObject);
begin
  Draw3D1.View3DOptions.Perspective:=TrackBar2.Position;
end;

procedure TOpenGLFootBall.TrackBar3Change(Sender: TObject);
begin
  TeeOpenGL1.Light.Position.X:=TrackBar3.Position
end;

procedure TOpenGLFootBall.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TOpenGLFootBall.Button5Click(Sender: TObject);
begin
  EditTeeOpenGL(Self,TeeOpenGL1);
end;

initialization
  RegisterClass(TOpenGLFootBall);
end.
