unit Area_Gradient;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TAreaGradient = class(TBaseForm)
    Button1: TButton;
    Series1: TAreaSeries;
    CheckBox1: TCheckBox;
    ScrollBar1: TScrollBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
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

Uses TeeEdiGrad;

procedure TAreaGradient.Button1Click(Sender: TObject);
begin
  EditTeeGradient(Self,Series1.AreaChartBrush.Gradient);
end;

procedure TAreaGradient.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);

  // This can be also done at design-time:

  With Series1.AreaChartBrush.Gradient do
  begin
    Visible:=True;
    StartColor:=clRed;
    MidColor:=clBlue;
    EndColor:=clGreen;
  end;
end;

procedure TAreaGradient.CheckBox1Click(Sender: TObject);
begin
  Series1.AreaChartBrush.Gradient.Visible:=CheckBox1.Checked;
end;

procedure TAreaGradient.ScrollBar1Change(Sender: TObject);
begin
  Series1.Transparency:=ScrollBar1.Position;
end;

initialization
  RegisterClass(TAreaGradient);
end.
