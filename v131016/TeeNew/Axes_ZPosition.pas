unit Axes_ZPosition;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TAxesZPosition = class(TBaseForm)
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Series1: TLineSeries;
    ComboBox1: TComboFlat;
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

procedure TAxesZPosition.ScrollBar1Change(Sender: TObject);
begin
  // change both the axis Z position and the Grid ending Z position too.

  if ComboBox1.ItemIndex=0 then
  begin
    Chart1.Axes.Left.ZPosition:=ScrollBar1.Position;
    Chart1.Axes.Left.Grid.ZPosition:=ScrollBar1.Position;
  end
  else
  begin
    Chart1.Axes.Right.ZPosition:=ScrollBar1.Position;
    Chart1.Axes.Right.Grid.ZPosition:=ScrollBar1.Position;
  end;

  Label2.Caption:=IntToStr(ScrollBar1.Position)+' %';
end;

procedure TAxesZPosition.FormCreate(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

procedure TAxesZPosition.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
     ScrollBar1.Position:=Round(Chart1.Axes.Left.ZPosition)
  else
     ScrollBar1.Position:=Round(Chart1.Axes.Right.ZPosition);
end;

initialization
  RegisterClass(TAxesZPosition);
end.
