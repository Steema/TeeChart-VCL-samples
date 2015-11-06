unit Wall_Transparency;
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
  Base, TeEngine, TeeSurfa, TeeTools, TeeProcs, Chart, TeeEdit, TeeOpenGL;

type
  TWallTransparency = class(TBaseForm)
    Label1: TLabel;
    Button1: TButton;
    ChartTool1: TRotateTool;
    Series1: TSurfaceSeries;
    ScrollBar1: TScrollBar;
    ChartEditor1: TChartEditor;
    Label2: TLabel;
    TeeOpenGL1: TTeeOpenGL;
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TWallTransparency.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

procedure TWallTransparency.ScrollBar1Change(Sender: TObject);
begin
  // Set transparency to all walls
  Chart1.Walls.Left.Transparency:=ScrollBar1.Position;
  Chart1.Walls.Right.Transparency:=ScrollBar1.Position;
  Chart1.Walls.Bottom.Transparency:=ScrollBar1.Position;
  Chart1.Walls.Back.Transparency:=ScrollBar1.Position;

  Label2.Caption:=IntToStr(ScrollBar1.Position);
end;

procedure TWallTransparency.FormCreate(Sender: TObject);

  // Example of complex surface...
  function Calc(x,y:Double):Double;
  const  a=3.0;
         b=10.0;
         c=5.0;
         d=1.0;
  begin
    x:=x/3.0;
    y:=y/3.0;
    result:=  a*sqr(d-x)*exp(-(x*x)-Sqr(y+d))
              -b*(x/c-(x*x*x)-(y*y*y*y*y))*exp(-sqr(x)-sqr(y))
              -(d/a)*exp(-sqr(x+d)-sqr(y));
  end;

var x,z: Integer;
begin
  inherited;

  // Fill surface
  for x:=-10 to 10 do
      for z:=-10 to 10 do Series1.AddXYZ(x,Calc(x,z),z);
end;

initialization
  RegisterClass(TWallTransparency);
end.
