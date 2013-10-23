unit TeeCustomShape;
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
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart;

type
  TCustomShape = class(TBaseForm)
    Button1: TButton;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    ScrollBar2: TScrollBar;
    Label2: TLabel;
    procedure Chart1AfterDraw(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBar2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Shape : TTeeShape;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeCanvas, TeeCustomShapeEditor;

procedure TCustomShape.Chart1AfterDraw(Sender: TObject);
begin
  // Draw the shape !
  Shape.Draw;

  // Draw "Hello World!"
  With Chart1.Canvas do
  begin
    AssignFont(Shape.Font);
    BackMode:=cbmTransparent;
    TextOut(Shape.ShapeBounds.Left+10,Shape.ShapeBounds.Top+10,'Hello World !');
  end;
end;

procedure TCustomShape.FormCreate(Sender: TObject);
Const clOrange=$0080FF;
begin
  inherited;

  Shape:=TTeeShape.Create(Chart1);
  Shape.ShapeBounds:=Rect(50,50,130,90);
  Shape.Gradient.Visible:=True;
  Shape.Gradient.MidColor:=clOrange;
  Shape.Gradient.EndColor:=clDkGray;
  Shape.Bevel:=bvRaised;
  Shape.BevelWidth:=3;
  Shape.Font.Color:=clNavy;
  Shape.Font.Shadow.HorizSize:=1;
  Shape.Font.Shadow.VertSize:=1;
  Shape.Shadow.Transparency:=70;
  Shape.Shadow.Size:=5;
end;

procedure TCustomShape.FormDestroy(Sender: TObject);
begin
  inherited;
  Shape.Free;
end;

procedure TCustomShape.Button1Click(Sender: TObject);
begin
  EditTeeCustomShape(Self,Shape);
end;

procedure TCustomShape.ScrollBar1Change(Sender: TObject);
begin
  With Shape.ShapeBounds do
  begin
    Left:=ScrollBar1.Position;
    Right:=Left+80;
  end;
  Chart1.Invalidate;
end;

procedure TCustomShape.Chart1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if PointInRect(Shape.ShapeBounds,x,y) then
  begin
    ShowMessage('Touche!');
    Chart1.CancelMouse:=True;
  end;
end;

procedure TCustomShape.Chart1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if PointInRect(Shape.ShapeBounds,x,y) then
     Chart1.Cursor:=crHandPoint
  else
     Chart1.Cursor:=crDefault;
  Chart1.OriginalCursor:=Chart1.Cursor;
end;

procedure TCustomShape.ScrollBar2Change(Sender: TObject);
begin
  With Shape.ShapeBounds do
  begin
    Top:=ScrollBar2.Position;
    Bottom:=Top+40;
  end;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TCustomShape);
end.
