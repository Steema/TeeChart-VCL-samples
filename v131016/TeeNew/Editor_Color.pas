unit Editor_Color;
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
  Base, TeeProcs, TeEngine, Chart, TeCanvas;

type
  TEditorColor = class(TBaseForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

procedure TEditorColor.Button1Click(Sender: TObject);
begin
  Chart1.Color:=EditColor(Self,Chart1.Color);
end;

procedure TEditorColor.FormCreate(Sender: TObject);
begin
  inherited;

  { create custom colors if not yet created }
  if not Assigned(TeeCustomEditColors) then
     TeeCustomEditColors:=TStringList.Create;

  { add two custom colors }
  With TeeCustomEditColors do
  begin
    Add('ColorA=D5C4AC');
    Add('ColorB=A7DAC8');
  end;
end;

initialization
  RegisterClass(TEditorColor);
end.
