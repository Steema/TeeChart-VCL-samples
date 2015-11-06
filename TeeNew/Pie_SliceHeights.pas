unit Pie_SliceHeights;
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
  Base, TeEngine, Series, TeeDonut, TeeProcs, Chart;

type
  TPieSliceHeights = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TDonutSeries;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
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

procedure TPieSliceHeights.CheckBox1Click(Sender: TObject);
var t : Integer;
begin
  for t:=0 to Series1.Count-1 do
  if CheckBox1.Checked then
     Series1.SliceHeight[t]:= Round( t*100/Series1.Count ) // vary height
  else
     Series1.SliceHeight[t]:=100;  // total height for all slices
end;

procedure TPieSliceHeights.FormCreate(Sender: TObject);
begin
  inherited;

  // change viewer orientation
  Series1.RotationAngle:=135;
  Chart1.View3DOptions.Elevation:=320;

  Series1.FillSampleValues;
  CheckBox1Click(Self);

  ScrollBar1.Position:=Series1.RotationAngle;
  ScrollBar2.Position:=Chart1.View3DOptions.Elevation;
end;

procedure TPieSliceHeights.ScrollBar1Change(Sender: TObject);
begin
  // Change pie rotation
  Series1.RotationAngle:=ScrollBar1.Position;
end;

procedure TPieSliceHeights.ScrollBar2Change(Sender: TObject);
begin
  // Change pie elevation
  Chart1.View3DOptions.Elevation:=ScrollBar2.Position;
end;

initialization
  RegisterClass(TPieSliceHeights);
end.
