unit OpenGL_AntiAlias;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QImgList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList,
  {$ENDIF}
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, TeeOpenGL, TeeGLEditor,
  TeePenDlg, TeeTools, TeeSurfa, TeeGLCanvas;

type
  TOpenGLAntiAlias = class(TBaseForm)
    ChartTool1: TRotateTool;
    Series1: TFastLineSeries;
    Series2: TSurfaceSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    cbObjects: TCheckBox;
    ButtonPen1: TButtonPen;
    ScrollBar4: TScrollBar;
    Label1: TLabel;
    ScrollBar5: TScrollBar;
    cbRotate: TCheckBox;
    cbAntialias: TCheckBox;
    ComboFlat1: TComboFlat;
    Timer1: TTimer;
    TeeOpenGL1: TTeeOpenGL;
    cbOpenGL: TCheckBox;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure cbAntialiasClick(Sender: TObject);
    procedure cbRotateClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbOpenGLClick(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure cbObjectsClick(Sender: TObject);
  private
    { Private declarations }
    BarPen : TChartPen;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  OpenGL2, Math;

procedure TOpenGLAntiAlias.FormCreate(Sender: TObject);
begin
  inherited;

  Series4.BarBrush.Image.Bitmap:=Image1.Picture.Bitmap;
  Series3.BarBrush.Image.Bitmap:=Image2.Picture.Bitmap;

  Chart1.View3DOptions.Perspective:=120;
  TeeOpenGL1.Antialias:=True;
  TeeOpenGL1.Active:=True;

  Series3.SetNull(0);

  BarPen:=TChartPen.Create(Chart1.CanvasChanged);
  ButtonPen1.LinkPen(BarPen);
end;

procedure TOpenGLAntiAlias.cbAntialiasClick(Sender: TObject);
begin
  TeeOpenGL1.Antialias:=cbAntialias.Checked;
end;

procedure TOpenGLAntiAlias.cbRotateClick(Sender: TObject);
begin
  Timer1.Enabled:=cbRotate.Checked;
end;

procedure TOpenGLAntiAlias.Timer1Timer(Sender: TObject);
var tmp : Double;
begin
  with Chart1.View3DOptions do
  begin
    tmp:=ScrollBar5.Position*0.01;
    ElevationFloat:=ElevationFloat+tmp;
    RotationFloat:=RotationFloat+tmp;
  end;
end;

procedure TOpenGLAntiAlias.cbOpenGLClick(Sender: TObject);
begin
  TeeOpenGL1.Active:=cbOpenGL.Checked;
end;

type
  TGLCanvasAccess=class(TGLCanvas);

procedure TOpenGLAntiAlias.Chart1AfterDraw(Sender: TObject);
var xc,zc : Double;
    s0, c0 : Extended;
    s1, c1 : Extended;

  procedure AddRotated(x,y,z:Double; const s,c:Extended);
  var tmpx : Double;
  begin
    tmpx:=x-xc;
    z:=z+zc;
    x:=xc+( tmpx*c + z*s );
    z:=zc+(-tmpx*s + z*c );

    glVertex3d(X,Y,Z);
  end;

var n, t,t1,t2 : Integer;
    DifY : Double;
    x0,y0,z0 : Double;
    x1,y1,z1 : Double;
begin
  Caption:=FloatToStr(Chart1.View3DOptions.RotationFloat);

  if cbObjects.Checked then
  begin
    if Chart1.Canvas is TGLCanvas then
    with Chart1.Canvas as TGLCanvas do
    begin
      X0:=100; X1:=150;
      Z0:=0; Z1:=-Chart1.SeriesWidth3D;
      xc:=(x0+x1)*0.5;
      zc:=(z0+z1)*0.5;

      t1:=ScrollBar1.Position;
      t2:=ScrollBar2.Position;

      Y1:=Chart1.ChartRect.Bottom;

      n:=ScrollBar3.Position;

      DifY:=(Y1-Chart1.ChartYCenter)/n;

      Y0:=0;

      for t:=1 to n do
      begin
        Y0:=Y1-DifY;

        SinCos(t1*TeePiStep,s0,c0);
        SinCos(t2*TeePiStep,s1,c1);

        Inc(t2,2);

        glBegin(GL_QUADS);
        SetColor(clRed);

        glNormal3i(1,0,0);
        AddRotated(X0,-Y0,-Z0,s0,c0);
        AddRotated(X1,-Y0,-Z0,s0,c0);
        AddRotated(X1,-Y1,-Z0,s1,c1);
        AddRotated(X0,-Y1,-Z0,s1,c1);
        glEnd;

        glBegin(GL_QUADS);
        SetColor(clMaroon);

        glNormal3i(-1,0,0);
        AddRotated(X0,-Y0,-Z1,s0,c0);
        AddRotated(X1,-Y0,-Z1,s0,c0);
        AddRotated(X1,-Y1,-Z1,s1,c1);
        AddRotated(X0,-Y1,-Z1,s1,c1);
        glEnd;

        if BarPen.Visible then
           TGLCanvasAccess(Chart1.Canvas).BeginPen(GL_LINE_LOOP,BarPen)
        else
           glBegin(GL_LINE_LOOP);

        AddRotated(X0,-Y0,-Z0,s0,c0);
        AddRotated(X1,-Y0,-Z0,s0,c0);
        AddRotated(X1,-Y1,-Z0,s1,c1);
        AddRotated(X0,-Y1,-Z0,s1,c1);
        glEnd;

        glBegin(GL_LINE_LOOP);
        AddRotated(X0,-Y0,-Z1,s0,c0);
        AddRotated(X0,-Y1,-Z1,s1,c1);
        AddRotated(X1,-Y1,-Z1,s1,c1);
        AddRotated(X1,-Y0,-Z1,s0,c0);
        glEnd;

        Y1:=Y0;
      end;

      glBegin(GL_LINES);
      AddRotated(X0,-Y0,-Z0,s0,c0);
      AddRotated(X0,-Y0,-Z1,s0,c0);
      AddRotated(X1,-Y0,-Z0,s0,c0);
      AddRotated(X1,-Y0,-Z1,s0,c0);
      AddRotated(X0,-Y1,-Z0,s1,c1);
      AddRotated(X0,-Y1,-Z1,s1,c1);
      AddRotated(X1,-Y1,-Z0,s1,c1);
      AddRotated(X1,-Y1,-Z1,s1,c1);
      glEnd;
    end;
  end;
end;

procedure TOpenGLAntiAlias.ScrollBar1Change(Sender: TObject);
begin
  Chart1.Invalidate;
end;

procedure TOpenGLAntiAlias.FormDestroy(Sender: TObject);
begin
  BarPen.Free;
end;

procedure TOpenGLAntiAlias.ComboFlat1Change(Sender: TObject);
begin
  Chart1.Axes.Left.Axis.LineMode:=TPenLineMode(ComboFlat1.ItemIndex);
  Chart1.Axes.Bottom.Axis.LineMode:=TPenLineMode(ComboFlat1.ItemIndex);
end;

procedure TOpenGLAntiAlias.cbObjectsClick(Sender: TObject);
begin
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TOpenGLAntiAlias);
end.
