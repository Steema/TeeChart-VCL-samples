unit Pie_MarksVertCenter;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, Pie_MarksLegSize;

type
  TPieMarksVertCenter = class(TPieMarksLegSize)
    cbVertCenter: TCheckBox;
    procedure cbVertCenterClick(Sender: TObject);
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

procedure TPieMarksVertCenter.cbVertCenterClick(Sender: TObject);
begin
  Series1.PieMarks.VertCenter:=cbVertCenter.Checked;
end;

procedure TPieMarksVertCenter.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D:=True;

  with Series1 do
  begin
    Pen.Style:=psDot;
    Marks.Arrow.Color:=clblack;
    Marks.Arrow.Width:=2;
    PieMarks.VertCenter:=True;
    PieMarks.LegSize:= ScrollBar1.Position;
  end;
end;

initialization
  RegisterClass(TPieMarksVertCenter);
end.
