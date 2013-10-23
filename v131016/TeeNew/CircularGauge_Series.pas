unit CircularGauge_Series;
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
  TCircularGauge_SeriesForm = class(TBaseForm)
    Series1: TCircularGauge;
    cbAnimate: TCheckBox;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EFWidth: TEdit;
    UDFWidth: TUpDown;
    Label3: TLabel;
    EFOuter: TEdit;
    UDFOuter: TUpDown;
    Label4: TLabel;
    EFMiddle: TEdit;
    UDFMiddle: TUpDown;
    Label5: TLabel;
    EFInner: TEdit;
    UDFInner: TUpDown;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbAnimateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EFWidthChange(Sender: TObject);
    procedure EFWidthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EFOuterChange(Sender: TObject);
    procedure EFOuterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    Up : Boolean;
    Value: Double;
    IsChanging : Boolean;

    FrameElementPercents: Array [0..2] of Double;

  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  EditChar, TeeFrames;

procedure TCircularGauge_SeriesForm.FormCreate(Sender: TObject);
begin
  FrameElementPercents[0] := 25;
  FrameElementPercents[1] := 60;
  FrameElementPercents[2] := 15;

  up := True;
  isChanging := False;
  value := 0.0;

  UDFOuter.Position := Round(FrameElementPercents[2]);
  UDFMiddle.Position := Round(FrameElementPercents[1]);
  UDFInner.Position := Round(FrameElementPercents[0]);
  UDFWidth.Position := Series1.Frame.Width;

  Timer1.Interval := 10;
  Timer1.Enabled := True;
end;

procedure TCircularGauge_SeriesForm.Timer1Timer(Sender: TObject);
begin
  inherited;

  if up then
     value := value + 1
  else
     value := value -1;

  if (value > 99) then
    up := False
  else
    if (value < 1) then
       up := True;

  Series1.Value := Value;
end;

procedure TCircularGauge_SeriesForm.cbAnimateClick(Sender: TObject);
begin
  Timer1.Enabled := cbAnimate.Checked;
end;

procedure TCircularGauge_SeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TCircularGauge_SeriesForm.EFWidthChange(Sender: TObject);
begin
  Series1.Frame.Width := Round(UDFWidth.Position);
  Series1.RefreshSeries;
end;

procedure TCircularGauge_SeriesForm.EFWidthKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EFWidthChange(sender);
end;

procedure RationaliseValues(var x: Double; var y: Double; var z: Double);
var
  tmpTotal, percentCoef: Double;
begin
  tmpTotal := (x + y) + z;

  if (tmpTotal <> 100.0) then
  begin
    percentCoef := 100.0 / tmpTotal;
    x := x * percentCoef;
    y := y * percentCoef;
    z := z * percentCoef;
  end;
end;

procedure TCircularGauge_SeriesForm.EFOuterChange(Sender: TObject);
var appOuter,appMiddle,appInner : double;
begin
  if (not isChanging) then
  begin
    isChanging := true;

    FrameElementPercents[0]:=round(UDFInner.Position);
    FrameElementPercents[1]:=round(UDFMiddle.Position);
    FrameElementPercents[2]:=round(UDFOuter.Position);

    appInner := FrameElementPercents[0];
    appMiddle := FrameElementPercents[1];
    appOuter := FrameElementPercents[2];

    TCircularFrame(Series1.Frame).FrameElementWidths[0]:=appInner;
    TCircularFrame(Series1.Frame).FrameElementWidths[1]:=appMiddle;
    TCircularFrame(Series1.Frame).FrameElementWidths[2]:=appOuter;

    RationaliseValues(appInner, appMiddle, appOuter);

    UDFOuter.Position := Round(appOuter);
    UDFMiddle.Position := Round(appMiddle);
    UDFInner.Position := Round(appInner);

    isChanging := false;
  end;

  Series1.Repaint;
end;

procedure TCircularGauge_SeriesForm.EFOuterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EFWidthChange(Sender);
end;

initialization
  RegisterClass(TCircularGauge_SeriesForm);
end.
