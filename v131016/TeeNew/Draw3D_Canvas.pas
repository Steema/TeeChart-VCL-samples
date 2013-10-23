unit Draw3D_Canvas;
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
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  {$IFDEF D17}
  System.Types,
  {$ENDIF}
  TeeProcs, TeeDraw3D, TeeComma, TeeOpenGL, TeeGLCanvas;

type
  TDraw3DCanvas = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    CheckBoxDrawAxes: TCheckBox;
    CheckBoxDrawRoom: TCheckBox;
    CheckBoxGradient: TCheckBox;
    TeeCommander1: TTeeCommander;
    Draw3D1: TDraw3D;
    TeeOpenGL1: TTeeOpenGL;
    CheckBox2: TCheckBox;
    procedure Draw3D1Paint(Sender: TObject; const ARect: TRect);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBoxDrawAxesClick(Sender: TObject);
    procedure CheckBoxDrawRoomClick(Sender: TObject);
    procedure CheckBoxGradientClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeCanvas;

{ This small function returns a random color }
Function RandomColor:TColor;
begin
  Case Random(8) of
    0: result:=clRed;
    1: result:=clYellow;
    2: result:=clGreen;
    3: result:=clBlue;
    4: result:=clNavy;
    5: result:=clAqua;
    6: result:=clLime;
  else
    result:=clWhite;
  end;
end;

procedure TDraw3DCanvas.Draw3D1Paint(Sender: TObject; const ARect: TRect);
Var CenterX     : Integer;
    CenterY     : Integer;
    CenterZ     : Integer;
    WithShadows : Boolean;
    t           : Integer;
    tmpX        : Integer;
    tmpY        : Integer;
begin
  { We should use this event to "Paint" shapes onto a Draw3D
    component Canvas.  }

  { We can for example, use the "Center" position in the 3D space }
  CenterX:=Draw3D1.ChartXCenter;
  CenterY:=Draw3D1.ChartYCenter;
  CenterZ:=0;

  { Determine if draw dark shape shadows or not }
  WithShadows:=CheckBox1.Checked;

  { Using the Canvas, let's draw some shapes... }
  With Draw3D1.Canvas do
  begin

    { Draw a "room". Notice only 2D drawing methods are used here }
    if CheckBoxDrawRoom.Checked then
    begin
      if TeeOpenGL1.Active then
         Draw3D1.Canvas.FrontPlaneBegin;

      { use a gradient to simulate a "room" ... }
      if CheckBoxGradient.Checked then
         GradientFill(Draw3D1.ChartBounds,clWhite,clGray,gdFromTopLeft)
      else
      { or use polygons... }
      begin
        Pen.Style:=psSolid;
        Pen.Color:=clBlack;
        Brush.Color:=clWhite;
        With Draw3D1.ChartBounds do
        begin
          tmpX:=(Right-Left) div 4;
          tmpY:=(Bottom-Top) div 4;
          Polygon([ Point(Left,Bottom),Point(Left,Top),
                    Point(Left+tmpX,Top+tmpY),Point(Left+tmpX,Bottom-tmpY)]);
          Polygon([ Point(Right,Bottom),Point(Right,Top),
                    Point(Right-tmpX,Top+tmpY),Point(Right-tmpX,Bottom-tmpY)]);
          Brush.Color:=clGray;
          Rectangle(Left+tmpX,Top+tmpY,Right-tmpX,Bottom-tmpY);
        end;
      end;

      if TeeOpenGL1.Active then
         Draw3D1.Canvas.FrontPlaneEnd;
    end;

    if CheckBoxDrawAxes.Checked then
    begin
      { Draw the "axis" }
      Pen.Color:=clNavy;
      Pen.Style:=psDot;
      BackMode:=cbmTransparent;

      VertLine3D(CenterX,CenterY-150,CenterY+150,CenterZ);
      HorizLine3D(CenterX-150,CenterX+150,CenterY,CenterZ);
      ZLine3D(CenterX,CenterY,CenterZ-150,CenterZ+150);
    end;

    { Draw 100 small random dots, to simulate "dust" }
    for t:=0 to 100 do
        Pixels3D[200+Random(50),120+Random(100),20+Random(100)]:=RandomColor;

    { Draw several shapes, planes, pyramids, cubes, etc }
    Pen.Color:=clBlack;
    Pen.Style:=psSolid;

    Brush.Color:=clAqua;
    Plane3D(Point(5,200),Point(90,240), -10,30);

    Brush.Color:=clYellow;
    Pyramid(False,5,150,130,200,5,30,WithShadows);

    Brush.Color:=clWhite;
    Cube(5,80,80,120,5,30,WithShadows);

    Brush.Color:=clLime;
    Cylinder(False,150,50,190,200,5,50,WithShadows);

    { Draw a 3D cone }
    Pen.Width:=1;
    Pen.Color:=clBlue;
    Brush.Color:=clWhite;
    Cone(True,CenterX-50,20,CenterX,50,20,80,WithShadows,0);

    Brush.Color:=clRed;
    EllipseWithZ(40,100,80,140,-20);

    Brush.Color:=clBlue;
    Pen.Color:=clYellow;
    Cube(CenterX+130,CenterX+170,120,190,70,100,WithShadows);

    Brush.Color:=clRed;
    Pen.Color:=clWhite;
    Cube(CenterX+30,CenterX+70,120,190,70,100,WithShadows);

    Brush.Color:=clRed;
    Pen.Color:=clYellow;
    Cube(CenterX+130,CenterX+170,120,190,10,30,WithShadows);

    Brush.Color:=clBlue;
    Pen.Color:=clWhite;
    Cube(CenterX+30,CenterX+70,120,190,10,30,WithShadows);

    Pen.Style:=psClear;
    Brush.Color:=clRed;
    Cylinder(False,CenterX+30,70,CenterX+170,100,70,100,WithShadows);
    Cylinder(False,CenterX+30,70,CenterX+170,100,10,40,WithShadows);
    Pen.Style:=psSolid;

    { Draw a pyramid on top of the cylinder }
    Brush.Color:=clWhite;
    Pen.Color:=clSilver;
    Pyramid(True,CenterX+30,40,CenterX+170,60,10,100,WithShadows);

    { Draw a black line on top of the pyramid }
    Pen.Color:=clBlack;
    Pen.Width:=2;
    MoveTo3D( CenterX+100, 40, 45 );
    LineTo3D( CenterX+100, 20, 45 );

    { Draw text at 3D xyz position, on top of the previous line }
    Font.Color:=clBlack;
    TextAlign:=ta_Center;
    BackMode:=cbmTransparent;
    TextOut3D(CenterX+100,0,45,'Hello!');
  end;
end;

procedure TDraw3DCanvas.FormCreate(Sender: TObject);
begin
  { Disable "ortho" perspective. We want full 3D }
  Draw3D1.View3DOptions.Orthogonal:=False;

  { Hide the toolbar "normal" button }
  TeeCommander1.ButtonNormal.Visible:=False;

  { ...and select the "rotate" button }
  TeeCommander1.ButtonRotate.Down:=True;

  { Nice rotation parameters... }
  With Draw3D1.View3DOptions do
  begin
    Rotation:=330;
    Elevation:=325;
  end;
end;

procedure TDraw3DCanvas.CheckBox1Click(Sender: TObject);
begin
  Draw3D1.Repaint;
end;

procedure TDraw3DCanvas.CheckBoxDrawAxesClick(Sender: TObject);
begin
  Draw3D1.Repaint;
end;

procedure TDraw3DCanvas.CheckBoxDrawRoomClick(Sender: TObject);
begin
  Draw3D1.Repaint;
  CheckBoxGradient.Enabled:=CheckBoxDrawRoom.Checked;
end;

procedure TDraw3DCanvas.CheckBoxGradientClick(Sender: TObject);
begin
  Draw3D1.Repaint;
end;

procedure TDraw3DCanvas.CheckBox2Click(Sender: TObject);
begin
  TeeOpenGL1.Active:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TDraw3DCanvas);
end.
