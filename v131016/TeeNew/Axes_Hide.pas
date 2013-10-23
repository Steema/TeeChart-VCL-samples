unit Axes_Hide;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeSurfa;

type
  TAxesHide = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TColorGridSeries;
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

uses
  Math;

procedure TAxesHide.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     Chart1.Axes.Hide
  else
     Chart1.Axes.Visible:=True;
end;

initialization
  RegisterClass(TAxesHide);
end.
