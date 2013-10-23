unit TriSurface_Hidding;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeTriSurface, TeeTools, TeeProcs, Chart,
  TeeOpenGL;

type
  TTriSurfaceHidding = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ChartTool1: TRotateTool;
    Series1: TTriSurfaceSeries;
    CheckBox3: TCheckBox;
    TeeOpenGL1: TTeeOpenGL;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
    Procedure Fill;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Procedure TTriSurfaceHidding.Fill;
var n : Double;
    m,
    x,
    z : Integer;
begin
  with Series1 do
  begin
    Clear;
    n:=0.5;
    m:=10; 
    for x:=-m to m do
        for z:=-m to m do
          AddXYZ(x,
             4*cos(3*sqrt(sqr(x/3) + sqr(z/3)))*exp(-n*(sqrt(sqr(x/3) + sqr(z/3)))),
                z);

  end;
end;

procedure TTriSurfaceHidding.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.HideTriangles:=CheckBox1.Checked;
  Series1.CacheTriangles:=CheckBox2.Checked;

  Fill;
end;

procedure TTriSurfaceHidding.CheckBox1Click(Sender: TObject);
begin
  Series1.HideTriangles:=CheckBox1.Checked;
end;

procedure TTriSurfaceHidding.CheckBox2Click(Sender: TObject);
begin
  Series1.CacheTriangles:=CheckBox2.Checked;
end;

procedure TTriSurfaceHidding.CheckBox3Click(Sender: TObject);
begin
  TeeOpenGL1.Active:=CheckBox3.Checked;

  // Disable "hidding triangles" (in OpenGL, they are always hidden)
  CheckBox1.Enabled:=not CheckBox3.Checked;
end;

initialization
  RegisterClass(TTriSurfaceHidding);
end.
