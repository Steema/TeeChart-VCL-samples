unit Pie_Semi;
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
  TPieSemi = class(TBaseForm)
    Series1: TPieSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TPieSemi.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);

  Series1.AngleSize:=180;
  Series1.RotationAngle:=90;
end;

procedure TPieSemi.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then Series1.AngleSize:=180
                       else Series1.AngleSize:=360;
end;

procedure TPieSemi.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then Series1.RotationAngle:=90
                       else Series1.RotationAngle:=0;
end;

initialization
  RegisterClass(TPieSemi);
end.
