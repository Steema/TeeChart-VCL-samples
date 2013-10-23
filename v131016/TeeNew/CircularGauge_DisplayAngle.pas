unit CircularGauge_DisplayAngle;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeCircularGauge,
  TeeNumericGauge, TeeLinearGauge;

type
  TCircularGauge_DisplayAngleForm = class(TBaseForm)
    Label1: TLabel;
    EDisplayTotalAngle: TEdit;
    UDDisplayTotalAngle: TUpDown;
    Label2: TLabel;
    EDisplayRotationAngle: TEdit;
    UDDisplayRotationAngle: TUpDown;
    Label3: TLabel;
    ETotalAngle: TEdit;
    UDTotalAngle: TUpDown;
    Label4: TLabel;
    ERotationAngle: TEdit;
    UDRotationAngle: TUpDown;
    Series1: TCircularGauge;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure EDisplayTotalAngleChange(Sender: TObject);
    procedure EDisplayRotationAngleChange(Sender: TObject);
    procedure ETotalAngleChange(Sender: TObject);
    procedure ERotationAngleChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    up : Boolean;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCircularGauge_DisplayAngleForm.FormShow(Sender: TObject);
begin
  up := True;
  UDDisplayTotalAngle.Position := Series1.DisplayTotalAngle;
  UDDisplayRotationAngle.Position := Series1.DisplayRotationAngle;
  UDTotalAngle.Position := round(Series1.TotalAngle);
  UDRotationAngle.Position := round(Series1.RotationAngle);

  with Series1 do
  begin
    DisplayTotalAngle := 200;
    DisplayRotationAngle := -100;
    TotalAngle := 178;
    RotationAngle := 90;
    Value := 1;
    Axis.LabelsFont.Size := 12;
    Axis.Axis.Visible := false;
    Axis.LabelsFont.Color := clGray;
    Axis.LabelsAngle := 90;
    Face.Color := Rgb(255,255,192);
    Face.Gradient.Visible := false;
    Frame.Width := 5;
    Hand.Distance := 20;
  end;

  Timer1.Enabled := true;
end;

procedure TCircularGauge_DisplayAngleForm.EDisplayTotalAngleChange(
  Sender: TObject);
begin
  Series1.DisplayTotalAngle := UDDisplayTotalAngle.Position;
end;

procedure TCircularGauge_DisplayAngleForm.EDisplayRotationAngleChange(
  Sender: TObject);
begin
  Series1.DisplayRotationAngle := UDDisplayRotationAngle.Position;
end;

procedure TCircularGauge_DisplayAngleForm.ETotalAngleChange(
  Sender: TObject);
begin
  Series1.TotalAngle := UDTotalAngle.Position;
end;

procedure TCircularGauge_DisplayAngleForm.ERotationAngleChange(
  Sender: TObject);
begin
  Series1.RotationAngle := UDRotationAngle.Position;
end;

procedure TCircularGauge_DisplayAngleForm.Timer1Timer(Sender: TObject);
begin
  if ((round(Series1.Value) = 100) or (round(Series1.Value) = 0.0)) then
     up := not up;

  if up then
     Series1.Value := Series1.Value + 1
  else
     Series1.Value := Series1.Value - 1;
end;

initialization
  RegisterClass(TCircularGauge_DisplayAngleForm);
end.
