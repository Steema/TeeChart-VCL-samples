unit Bubble_Transparency;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, BubbleCh, TeCanvas, TeeOpenGL;

type
  TBubbleTransparency = class(TBaseForm)
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Series1: TBubbleSeries;
    TeeOpenGL1: TTeeOpenGL;
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

procedure TBubbleTransparency.ScrollBar1Change(Sender: TObject);
begin
  Series1.Transparency:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(Series1.Transparency);
end;

procedure TBubbleTransparency.FormCreate(Sender: TObject);
var tmp:Integer;
begin
  inherited;
  Series1.FillSampleValues;

  // cosmetic gradient:
  Series1.Pointer.Gradient.Visible:=True;
  Series1.Pointer.Gradient.Direction:=gdRadial;

  // transparency:
  Series1.Transparency:=50;

  // Now, let's adjust horizontal axis to fit all bubbles...

  // 1) force chart redrawing
  Chart1.Draw;

  // 2) fit
  with Series1 do
  begin
    tmp:=GetVertAxis.CalcSizeValue(RadiusValues.First);
    GetHorizAxis.MinimumOffset:=tmp;
    tmp:=GetVertAxis.CalcSizeValue(RadiusValues.Last);
    GetHorizAxis.MaximumOffset:=tmp;
  end;
end;

initialization
  RegisterClass(TBubbleTransparency);
end.
