unit Polar_Smooth;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QImgList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  ImgList,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeePolar, TeeSpline;

type
  TPolarSmoothForm = class(TBaseForm)
    Series2: TPolarSeries;
    TeeFunction1: TSmoothingFunction;
    Series1: TPolarSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    procedure CheckBox3Click(Sender: TObject);
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

procedure TPolarSmoothForm.CheckBox3Click(Sender: TObject);
begin
  TeeFunction1.Interpolate:= CheckBox3.Checked;
end;

procedure TPolarSmoothForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Visible:= CheckBox1.Checked;
end;

procedure TPolarSmoothForm.CheckBox2Click(Sender: TObject);
begin
  Series2.Visible:= CheckBox2.Checked;
end;

initialization
  RegisterClass(TPolarSmoothForm);
end.
