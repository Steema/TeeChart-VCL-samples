unit Gradient_MidColor;
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
  Base, TeeProcs, TeEngine, Chart, TeePenDlg;

type
  TGradientMiddle = class(TBaseForm)
    Label1: TLabel;
    Shape1: TShape;
    CheckBox1: TCheckBox;
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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

Uses TeCanvas;

procedure TGradientMiddle.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  With Chart1.Gradient do
  begin
    MidColor:=EditColor(Self,MidColor);
    Shape1.Brush.Color:=MidColor;
    CheckBox1.Checked:=Chart1.Gradient.MidColor=clNone;
  end;
end;

procedure TGradientMiddle.FormCreate(Sender: TObject);
begin
  inherited;
  Shape1.Brush.Color:=Chart1.Gradient.MidColor;
end;

procedure TGradientMiddle.CheckBox1Click(Sender: TObject);
begin
  inherited;

  if CheckBox1.Checked then Chart1.Gradient.MidColor:=clNone
                       else Chart1.Gradient.UseMiddleColor;
end;

initialization
  RegisterClass(TGradientMiddle);
end.
