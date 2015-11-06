unit Gradient_RadialCenter;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart;

type
  TGradientRadial = class(TBaseForm)
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    TrackBar2: TTrackBar;
    Button1: TButton;
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses TeeEdiGrad;

procedure TGradientRadial.TrackBar1Change(Sender: TObject);
begin
  Chart1.Walls.Back.Gradient.RadialX:=TrackBar1.Position;
end;

procedure TGradientRadial.TrackBar2Change(Sender: TObject);
begin
  Chart1.Walls.Back.Gradient.RadialY:=TrackBar2.Position;
end;

procedure TGradientRadial.Button1Click(Sender: TObject);
begin
  EditTeeGradient(Self,Chart1.Walls.Back.Gradient)
end;

initialization
  RegisterClass(TGradientRadial);
end.
