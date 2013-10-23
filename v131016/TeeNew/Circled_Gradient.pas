unit Circled_Gradient;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeePolar, TeeProcs, Chart;

type
  TCircledGradient = class(TBaseForm)
    Series1: TPolarSeries;
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
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses TeeEdiGrad;

procedure TCircledGradient.Button1Click(Sender: TObject);
begin
  EditTeeGradient(Self,Series1.CircleGradient);
end;

procedure TCircledGradient.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
  Series1.Shadow.Visible := false;
end;

initialization
  RegisterClass(TCircledGradient);
end.
