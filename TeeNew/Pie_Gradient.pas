unit Pie_Gradient;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeDonut, TeeProcs, Chart, TeeGDIPlus;

type
  TPieGradientForm = class(TBaseForm)
    Button1: TButton;
    Series1: TDonutSeries;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses TeeEdiGrad;

procedure TPieGradientForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Gradient.Visible:=CheckBox1.Checked;
end;

procedure TPieGradientForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

procedure TPieGradientForm.Button1Click(Sender: TObject);
begin
  EditTeeGradient(Self,Series1.Gradient,True);
end;

initialization
  RegisterClass(TPieGradientForm);
end.
