unit Pointer_DrawCanvas;
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
  {$IFDEF D10}
  Types,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TPointerDrawCanvas = class(TBaseForm)
    Series1: TPointSeries;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

Uses TeCanvas, EditChar;

procedure TPointerDrawCanvas.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
end;

procedure TPointerDrawCanvas.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  PaintBox1.Repaint;
end;

type TPointerAccess=class(TSeriesPointer);

procedure TPointerDrawCanvas.PaintBox1Paint(Sender: TObject);
var tmp:Integer;
    ACanvas:TTeeCanvas3D;
    P:TPoint;
    AColor:TColor;
    R:TRect;
    XPos,YPos:Integer;
begin
  P:=Chart1.GetCursorPos;
  tmp:=Series1.Clicked(P.X,P.Y);
  if tmp<>-1 then
  begin
    AColor:=Series1.ValueColor[tmp];
    R:=PaintBox1.ClientRect;
    XPos:=(R.Left+R.Right) div 2;
    YPos:=(R.Top+R.Bottom) div 2;
    ACanvas:=TTeeCanvas3D.Create;
    try
      ACanvas.ReferenceCanvas:=PaintBox1.Canvas;
      With TPointerAccess(Series1.Pointer) do
      begin
        PrepareCanvas(ACanvas,AColor);
        DrawPointer(ACanvas,Chart1.View3D,
                    XPos,YPos,
                    HorizSize,VertSize,
                    AColor,
                    Series1.Pointer.Style);
      end;
    finally
      ACanvas.Free;
    end;
  end;
end;

procedure TPointerDrawCanvas.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TPointerDrawCanvas.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked
end;

initialization
  RegisterClass(TPointerDrawCanvas);
end.
