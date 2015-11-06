unit Commander_FullRotation;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeComma;

type
  TCommanderFullRotation = class(TBaseForm)
    cbFullRotation: TCheckBox;
    TeeCommander1: TTeeCommander;
    Series1: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure cbFullRotationClick(Sender: TObject);
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

procedure TCommanderFullRotation.FormCreate(Sender: TObject);
begin
  inherited;

  with TeeCommander1 do
  begin
    FullRotation:=true;
    DefaultButton:=tcbRotate;
  end;
end;

procedure TCommanderFullRotation.cbFullRotationClick(Sender: TObject);
begin
  TeeCommander1.FullRotation:=cbFullRotation.Checked;
end;

initialization
  RegisterClass(TCommanderFullRotation);
end.
