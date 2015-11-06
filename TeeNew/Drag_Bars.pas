unit Drag_Bars;
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
  Series, TeEngine, CurvFitt, TeeProcs, Chart, TeeComma;

type
  TDragBarForm = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    TeeFunction1: TTrendFunction;
    Series2: TBarSeries;
    TeeCommander1: TTeeCommander;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    Dragged : Integer;
    OldY    : Integer;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TDragBarForm.FormCreate(Sender: TObject);
begin
  Series2.FillSampleValues(7);
  Dragged:=-1;
end;

procedure TDragBarForm.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  { if dragging a bar then... }
  if Dragged<>-1 then
  With Series2 do
  begin
    { drag the bar, changing the bar's Y value }
    YValues[Dragged]:=YValues[Dragged]+(YScreenToValue(y)-YScreenToValue(OldY));
    OldY:=y;
  end;
end;

procedure TDragBarForm.Chart1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Dragged:=-1; { stop dragging }
end;

procedure TDragBarForm.RadioGroup1Click(Sender: TObject);
begin
  { change bar style }
  Series2.BarStyle:=TBarStyle(RadioGroup1.ItemIndex);
end;

procedure TDragBarForm.CheckBox1Click(Sender: TObject);
begin
  Series2.ColorEachPoint:=CheckBox1.Checked;
end;

procedure TDragBarForm.Chart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  { when clicking a Bar, start dragging }
  Dragged:=Series2.Clicked(X,Y);
  OldY:=Y;
end;

initialization
  RegisterClass(TDragBarForm);
end.
