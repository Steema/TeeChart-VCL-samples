unit ColorBand_Clicked;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, TeeTools, TeeProcs, Chart, TeeGDIPlus;

type
  TColorBandClicked = class(TBaseForm)
    ChartTool1: TColorBandTool;
    Label1: TLabel;
    procedure ChartTool1Click(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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

procedure TColorBandClicked.ChartTool1Click(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Label1.Caption:='Clicked at X:'+IntToStr(X)+' Y:'+IntToStr(Y);

  ChartTool1.Color:=RGB(Random(255),Random(255),Random(255));
end;

procedure TColorBandClicked.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ChartTool1.Clicked(x,y) then
     Chart1.Cursor:=crHandPoint
  else
     Chart1.Cursor:=crDefault;

  Chart1.OriginalCursor:=Chart1.Cursor;
end;

initialization
  RegisterClass(TColorBandClicked);
end.
