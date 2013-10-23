unit Commander_Gradient;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeComma, TeeEdiGrad;

type
  TCommanderGradient = class(TBaseForm)
    TeeCommander1: TTeeCommander;
    ButtonGradient1: TButtonGradient;
    Series1: TPieSeries;
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

procedure TCommanderGradient.FormCreate(Sender: TObject);
begin
  inherited;

  with TeeCommander1.Gradient do
  begin
    StartColor := clwhite;
    EndColor := clGrayText;
    MidColor := RGB(255,255,128);
    Visible:= true;
  end;

  ButtonGradient1.LinkGradient(TeeCommander1.Gradient);
end;

initialization
  RegisterClass(TCommanderGradient);
end.
