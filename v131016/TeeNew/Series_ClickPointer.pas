unit Series_ClickPointer;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart;

type
  TSeriesClickPointer = class(TBaseForm)
    Series1: TPointSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Label1: TLabel;
    procedure Series1ClickPointer(Sender: TCustomSeries; ValueIndex, X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
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

uses
  Math;

procedure TSeriesClickPointer.Series1ClickPointer(Sender: TCustomSeries;
  ValueIndex, X, Y: Integer);
begin
  Chart1.Repaint;  // <-- just necessary in this demo only, to remove previous "Clicked" text

  with TCustomSeries(Sender) do
    Label1.Caption:='Clicked Series:  ' + Title + '     Point:  ' +
      IntToStr(ValueIndex) +
      '    X:  ' + FormatFloat('#.00',XValue[ValueIndex]) +
      '    Y:  ' + FormatFloat('#.00',YValue[ValueIndex]);

  // Display the word "Clicked" at mouse xy position:
  Chart1.Canvas.TextOut(x,y,'Clicked');
end;

procedure TSeriesClickPointer.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.Canvas.Brush.Style:=bsClear;
  Chart1.Canvas.Font.Color:=clwhite;

  Series1.Cursor:=crHandPoint;
  Series2.Cursor:=crHandPoint;
  Series3.Cursor:=crHandPoint;
end;

initialization
  RegisterClass(TSeriesClickPointer);
end.
