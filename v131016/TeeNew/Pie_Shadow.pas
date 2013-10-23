unit Pie_Shadow;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TPieShadow = class(TBaseForm)
    Series1: TPieSeries;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
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

procedure TPieShadow.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     Series1.Shadow.Color:=Tee_CircledShadowColor
  else
     Series1.Shadow.Color:=clNone;
end;

procedure TPieShadow.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(9);

  Series1.Shadow.Color:=Tee_CircledShadowColor;  // (Silver color)
  Series1.Shadow.HorizSize:=30;
  Series1.Shadow.VertSize:=50;
end;

initialization
  RegisterClass(TPieShadow);
end.
