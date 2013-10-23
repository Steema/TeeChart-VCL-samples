unit Pie_MarksLegSize;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TPieMarksLegSize = class(TBaseForm)
    Series1: TPieSeries;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
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

procedure TPieMarksLegSize.ScrollBar1Change(Sender: TObject);
begin
  Series1.PieMarks.LegSize:=ScrollBar1.Position;
end;

procedure TPieMarksLegSize.FormCreate(Sender: TObject);
begin
  inherited;

  with Chart1 do
  begin
    View3D:=False;
    Legend.Transparent:=True;
  end;

  with Series1 do
  begin
    Circled:=True;
    Marks.Arrow.Color:=clDkGray;
    PieMarks.LegSize:=ScrollBar1.Position;
  end;
end;

initialization
  RegisterClass(TPieMarksLegSize);
end.

