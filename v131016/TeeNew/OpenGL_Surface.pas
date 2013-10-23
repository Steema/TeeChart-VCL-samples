unit OpenGL_Surface;
{$I TeeDefs.inc}

interface

{ This example adds one more extra Light to the OpenGL
  rendering scene. It also shows a Surface Series. }

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  SysUtils, Classes,
  TeEngine, TeeSurfa, TeePoin3, TeeProcs, Chart, TeeComma, TeeOpenGL,
  TeeEditPro;

type
  TOpenGLSurface = class(TForm)
    Chart1: TChart;
    TeeCommander1: TTeeCommander;
    Series1: TSurfaceSeries;
    Panel1: TPanel;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    ScrollBar4: TScrollBar;
    ScrollBar5: TScrollBar;
    Timer1: TTimer;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    RadioGroup1: TRadioGroup;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox7: TCheckBox;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    TrackBar1: TTrackBar;
    TeeOpenGL1: TTeeOpenGL;
    procedure FormCreate(Sender: TObject);
    procedure TeeOpenGL1Init(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure ScrollBar5Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
    a,b,c,d  : Double;
    Changing : Boolean;
    Formula  : Integer;
    DeltaA,
    DeltaB,
    DeltaC,
    DeltaD   : Integer;
    procedure Fill;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses {$IFDEF LINUX}
     OpenGLLinux,
     {$ELSE}
     OpenGL2,
     {$ENDIF}
     TeeGLEditor, TeeGLCanvas;

procedure TOpenGLSurface.FormCreate(Sender: TObject);
begin
  { initialize local variables... }
  Changing:=False;
  DeltaA:=2;
  DeltaB:=2;
  DeltaC:=6;
  DeltaD:=6;
  a:=3.0;
  b:=10.0;
  c:=5.0;
  d:=1.0;
  ScrollBar4.Position:=100;
  Formula:=0;
  TeeCommander1.ButtonRotate.Down:=True;
  { add the surface... }
  Fill;
end;

Procedure TOpenGLSurface.Fill;

  { return a surface cell value... }
  Function Calc(x,y:Double):Double;
  begin
    Case Formula of
      0:  begin
            x:=x/3.0;
            y:=y/3.0;
            Result:=  a*sqr(d-x)*exp(-(x*x)-Sqr(y+d))
            -b*(x/c-(x*x*x)-(y*y*y*y*y))*exp(-sqr(x)-sqr(y))
            -(d/a)*exp(-sqr(x+d)-sqr(y));
          end;
      1: begin
          x:=(x/15.0)*random(100)/100.0;
          y:=(y/15.0)*random(100)/100.0;
          result:=cos(x+sqr(y)+a*b*c*d);
         end;
      2: begin
          x:=(x/15.0)*pi/3.0;
          y:=(y/15.0)*pi/1;
          result:=cos(sqr(a)+x*sin(y)+sin(sqr(b)+x)*sqr(cos(sqr(c*d+y))));;
         end;
    else
    begin
      result:=0;
    end;
    end;
  end;

var i,j:Integer;
begin
  { do a loop and fill a 21 x 21 surface... }
  if not Changing then
  with Series1 do
  begin
    Clear;
    for i:=-10 to 10 do
        for j:=-10 to 10 do AddXYZ(i,Calc(i,j),j);
    if CheckBox2.Checked then PaletteSteps:=32;
  end;
  { show the formula parameters... }
  Label1.Caption:=FloatToStr(a);
  Label2.Caption:=FloatToStr(b);
  Label3.Caption:=FloatToStr(c);
  Label4.Caption:=FloatToStr(d);

  // Speed trick...
  Chart1.Axes.FastCalc:=True;
end;

{$IFDEF CLR}
{$UNSAFECODE ON}
{$ENDIF}

{ use OpenGL native API to add an extra "light" to the scene }
Procedure AddExtraLight(Const Ambient,Diffuse,Specular,X,Y,Z:Double); {$IFDEF CLR}unsafe;{$ENDIF}
var tmp : GLMat;
begin
  glEnable(GL_LIGHT1);

  tmp[0]:=Ambient;
  tmp[1]:=Ambient;
  tmp[2]:=Ambient;
  tmp[3]:=1;
  glLightfv(GL_LIGHT1,  GL_AMBIENT, @tmp);

  tmp[0]:=Diffuse;
  tmp[1]:=Diffuse;
  tmp[2]:=Diffuse;
  tmp[3]:=1;
  glLightfv(GL_LIGHT1,  GL_DIFFUSE, @tmp);

  tmp[0]:=Specular;
  tmp[1]:=Specular;
  tmp[2]:=Specular;
  tmp[3]:=1;
  glLightfv(GL_LIGHT1,  GL_SPECULAR, @tmp);

  tmp[0]:=  200;
  tmp[1]:=  100;
  tmp[2]:= -150;
  tmp[3]:=    1;
  glLightfv(GL_LIGHT1, GL_POSITION, @tmp);
end;

Procedure DisableExtraLight;
begin
  glDisable(GL_LIGHT1);
end;

{ On OpenGL initialization, add the extra light... }
procedure TOpenGLSurface.TeeOpenGL1Init(Sender: TObject);
begin
  if CheckBox7.Checked then AddExtraLight(0.6,0.2,0.9,200,100,-150)
                       else DisableExtraLight;
end;

procedure TOpenGLSurface.ScrollBar2Change(Sender: TObject);
begin
  a:=ScrollBar2.Position/100.0;
  Fill;
end;

procedure TOpenGLSurface.ScrollBar3Change(Sender: TObject);
begin
  b:=ScrollBar3.Position/100.0;
  Fill;
end;

procedure TOpenGLSurface.ScrollBar4Change(Sender: TObject);
begin
  c:=ScrollBar4.Position/100.0;
  Fill;
end;

procedure TOpenGLSurface.ScrollBar5Change(Sender: TObject);
begin
  d:=ScrollBar5.Position/100.0;
  Fill;
end;

{ animation... }
procedure TOpenGLSurface.Timer1Timer(Sender: TObject);

 Procedure ChangeScroll(ABar:TScrollBar; Var ADelta:Integer);
 begin
   With ABar do
    if ((Position+ADelta)<Min) or ((Position+ADelta)>Max) then
       ADelta:=-ADelta
    else
       Position:=Position+ADelta;
 end;

begin
  Timer1.Enabled:=False;
  Changing:=True;
  ChangeScroll(ScrollBar2,DeltaA);
  ChangeScroll(ScrollBar3,DeltaB);
  ChangeScroll(ScrollBar4,DeltaC);
  ChangeScroll(ScrollBar5,DeltaD);
  Changing:=False;
  Fill;
  With Chart1.View3DOptions do
  begin
    Rotation:=Rotation+1;
    if Rotation>360 then Rotation:=Rotation-360;
  end;
  Timer1.Enabled:=True;
end;

procedure TOpenGLSurface.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TOpenGLSurface.CheckBox3Click(Sender: TObject);
begin
  Chart1.View3DWalls:=CheckBox3.Checked;
end;

procedure TOpenGLSurface.CheckBox4Click(Sender: TObject);
begin
  Series1.Pen.Visible:=CheckBox4.Checked
end;

procedure TOpenGLSurface.RadioGroup1Click(Sender: TObject);
begin
  Formula:=RadioGroup1.ItemIndex;
  Fill;
end;

procedure TOpenGLSurface.CheckBox5Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox5.Checked
end;

procedure TOpenGLSurface.CheckBox6Click(Sender: TObject);
begin
  Series1.WireFrame:=not CheckBox6.Checked
end;

procedure TOpenGLSurface.CheckBox2Click(Sender: TObject);
begin
  Series1.UsePalette:=CheckBox2.Checked;
  Series1.UseColorRange:=not CheckBox2.Checked;
end;

procedure TOpenGLSurface.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Timer1.Enabled:=False;
end;

{ change the light "spot" parameter... }
procedure TOpenGLSurface.TrackBar1Change(Sender: TObject);
begin
  TeeDefaultLightSpot:=TrackBar1.Position;
  if TeeDefaultLightSpot=91 then TeeDefaultLightSpot:=180;
  Chart1.Repaint;
end;

initialization
  RegisterClass(TOpenGLSurface);
end.
