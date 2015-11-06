unit ButtonGradient;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeEdiGrad, TeeShape;

type
  TButtonGradientForm = class(TBaseForm)
    bGradient: TButtonGradient;
    bBackGradient: TButtonGradient;
    Series1: TChartShape;
    bShapeGradient: TButtonGradient;
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

procedure TButtonGradientForm.FormCreate(Sender: TObject);
begin
  inherited;

  with Chart1 do
  begin
    Gradient.Visible:=true;
    Walls.Back.Transparent:=false;
    Walls.Back.Gradient.Visible:=true;
  end;

  bGradient.LinkGradient(Chart1.Gradient);
  bBackGradient.LinkGradient(Chart1.Walls.Back.Gradient);
  bShapeGradient.LinkGradient(Series1.Gradient);
end;

initialization
  RegisterClass(TButtonGradientForm);
end.
