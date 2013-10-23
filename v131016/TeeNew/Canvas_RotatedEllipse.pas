unit Canvas_RotatedEllipse;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF D8}
  Types,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeTools;

type
  TCanvasRotatedEllipse = class(TBaseForm)
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    ChartTool1: TRotateTool;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure Chart1AfterDraw(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses TeCanvas;

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCanvasRotatedEllipse.Chart1AfterDraw(Sender: TObject);
var P : TPointArray;
begin
  with Chart1.Canvas do
  begin
    RotatedEllipse(50,90,250,160,0,ScrollBar1.Position);

    SetLength(P,5);
    P[0]:=Point(300,200);
    P[1]:=Point(350,190);
    P[2]:=Point(380,210);
    P[3]:=Point(320,90);
    P[4]:=Point(290,180);
    Polyline(P,0);
    P:=nil;
  end;
end;

procedure TCanvasRotatedEllipse.ScrollBar1Change(Sender: TObject);
begin
  Label2.Caption:=IntToStr(ScrollBar1.Position);
  Chart1.Invalidate;
end;

procedure TCanvasRotatedEllipse.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TCanvasRotatedEllipse);
end.
