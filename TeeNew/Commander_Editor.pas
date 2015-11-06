unit Commander_Editor;
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
  Base, TeeComma, TeeProcs, TeEngine, Chart;

type
  TCommanderEditorExample = class(TBaseForm)
    TeeCommander1: TTeeCommander;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

Uses TeeCommanderEditor;

procedure TCommanderEditorExample.Button1Click(Sender: TObject);
begin
  TeeCommanderEdit(Self,TeeCommander1);
end;

initialization
  RegisterClass(TCommanderEditorExample);
end.
