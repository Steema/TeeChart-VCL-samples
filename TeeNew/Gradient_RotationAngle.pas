unit Gradient_RotationAngle;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeEdiGrad;

type
  TGradientRotationAngle = class(TBaseForm)
    bGradient: TButtonGradient;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TGradientRotationAngle.FormCreate(Sender: TObject);
begin
  inherited;
  bGradient.LinkGradient(Chart1.Gradient);
  Chart1.Gradient.Angle:=0;
end;

procedure TGradientRotationAngle.Edit1Change(Sender: TObject);
begin
  Chart1.Gradient.Angle:=UpDown1.Position;
end;

initialization
  RegisterClass(TGradientRotationAngle);
end.
