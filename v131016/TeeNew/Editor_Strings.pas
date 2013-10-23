unit Editor_Strings;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeTools, BubbleCh;

type
  TEditorStrings = class(TBaseForm)
    Series1: TBubbleSeries;
    ChartTool1: TAnnotationTool;
    bEdit: TButton;
    procedure bEditClick(Sender: TObject);
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
  TeeStringsEditor;

procedure TEditorStrings.bEditClick(Sender: TObject);
var tmp : string;
begin
  tmp:=ChartTool1.Text;

  if TeeEditStrings(Self,tmp) then
     ChartTool1.Text:=tmp;
end;

initialization
  RegisterClass(TEditorStrings);
end.
