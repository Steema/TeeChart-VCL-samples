unit Point3D_Event;
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
  Base, TeEngine, TeeSurfa, TeePoin3, Series, TeeProcs, Chart, TeeComma,
  TeeGDIPlus;

type
  TPoint3DEvent = class(TBaseForm)
    Series1: TPoint3DSeries;
    CheckBox1: TCheckBox;
    TeeCommander1: TTeeCommander;
    function Series1GetPointerStyle(Sender: TChartSeries;
      ValueIndex: Integer): TSeriesPointerStyle;
    procedure FormCreate(Sender: TObject);
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

function TPoint3DEvent.Series1GetPointerStyle(Sender: TChartSeries;
  ValueIndex: Integer): TSeriesPointerStyle;
begin
  result:=psRectangle;

  if CheckBox1.Checked then
  Case ValueIndex mod 3 of
    0: begin result:=psCircle; Series1.Pointer.Brush.Color:=clRed; end;
    1: begin result:=psTriangle; Series1.Pointer.Brush.Color:=clBlue; end;
    2: begin result:=psRectangle; Series1.Pointer.Brush.Color:=clYellow; end;
  end
  else
  begin
    result:=psRectangle;
    Series1.Pointer.Brush.Color:=clTeeColor;
  end;
end;

procedure TPoint3DEvent.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.View3D := True;
  Series1.FillSampleValues(20);
end;

procedure TPoint3DEvent.CheckBox1Click(Sender: TObject);
begin
  Series1.Repaint;
end;

initialization
  RegisterClass(TPoint3DEvent);
end.
