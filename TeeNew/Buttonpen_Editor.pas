unit Buttonpen_Editor;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeePenDlg;

type
  TButtonpenEditor = class(TBaseForm)
    ButtonPen1: TButtonPen;
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

procedure TButtonpenEditor.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.Walls.Back.Pen.Color:=clRed;
  Chart1.Walls.Back.Pen.Width:=4;

  ButtonPen1.LinkPen(Chart1.Walls.Back.Pen);
end;

initialization
  RegisterClass(TButtonpenEditor);
end.
