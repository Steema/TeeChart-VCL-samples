unit Wall_AutoHide;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TWallAutoHide = class(TBaseForm)
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    Series1: TFastLineSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TWallAutoHide.FormCreate(Sender: TObject);
begin
  inherited;

  // Set all walls "Size" property at once:
  Chart1.Walls.Size:=5;

  // Show Right wall
  Chart1.Walls.Right.Visible:=True;
  Chart1.Walls.Right.AutoHide:=True;

  Chart1.Walls.Left.AutoHide:=True;
  Chart1.Walls.Back.AutoHide:=True;
  Chart1.Walls.Back.Transparent:=False;

  Color:=clWhite;
end;

procedure TWallAutoHide.ScrollBar1Change(Sender: TObject);
begin
  Chart1.View3DOptions.Rotation:=ScrollBar1.Position;
end;

procedure TWallAutoHide.CheckBox1Click(Sender: TObject);
begin
  inherited;

  with Chart1.Walls do
  begin
    Left.AutoHide:=CheckBox1.Checked;
    Right.AutoHide:=CheckBox1.Checked;
    Back.AutoHide:=CheckBox1.Checked;
  end;
end;

initialization
  RegisterClass(TWallAutoHide);
end.
