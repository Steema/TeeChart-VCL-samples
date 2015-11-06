unit Function_ExpAve;
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
  Base, TeEngine, StatChar, Series, TeeProcs, Chart;

type
  TExpAveForm = class(TBaseForm)
    TeeFunction1: TExpAverageFunction;
    Series2: TLineSeries;
    Series1: TLineSeries;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure TrackBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Delta: Integer;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TExpAveForm.TrackBar1Change(Sender: TObject);
begin
  TeeFunction1.Weight:=TrackBar1.Position/100.0;
  Label2.Caption:=FormatFloat('0.00',TeeFunction1.Weight);
end;

procedure TExpAveForm.FormCreate(Sender: TObject);
begin
  inherited;
  Delta:=2;
  Series1.FillSampleValues(30);
end;

procedure TExpAveForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TExpAveForm.Timer1Timer(Sender: TObject);
begin
  TrackBar1.Position:=TrackBar1.Position+Delta;
  if (TrackBar1.Position<2) or (TrackBar1.Position>98) then
     Delta:=-Delta;
end;

initialization
  RegisterClass(TExpAveForm);
end.
