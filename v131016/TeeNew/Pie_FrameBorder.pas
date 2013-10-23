unit Pie_FrameBorder;
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
  Base, TeCanvas, TeEngine, Series, Bar3D, TeeProcs, Chart;

type
  TPieFrameBorderForm = class(TBaseForm)
    cbFrameVisible: TCheckBox;
    Button1: TButton;
    Label3: TLabel;
    EInnerWidth: TEdit;
    UDInnerWidth: TUpDown;
    Label1: TLabel;
    EOuterWidth: TEdit;
    UDOuterWidth: TUpDown;
    Label2: TLabel;
    Label4: TLabel;
    EMiddleWidth: TEdit;
    UDMiddleWidth: TUpDown;
    Label5: TLabel;
    EFWidth: TEdit;
    UDWidth: TUpDown;
    Series1: TPieSeries;
    procedure FormCreate(Sender: TObject);
    procedure cbFrameVisibleClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EInnerWidthChange(Sender: TObject);
    procedure EFWidthChange(Sender: TObject);
  private
    { Private declarations }
    isChanging : Boolean;
  public
    { Public declarations }
  end;

var
  PieFrameBorderForm: TPieFrameBorderForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar, TeeFrames;

var
  FrameElementPercents: Array [0..2] of Double;

procedure TPieFrameBorderForm.FormCreate(Sender: TObject);
begin
  inherited;

  FrameElementPercents[0] := 25;
  FrameElementPercents[1] := 60;
  FrameElementPercents[2] := 15;

  with Series1 do
  begin
    Circled := True;
    PiePen.Visible := False;
    Marks.Visible := False;
  end;

  cbFrameVisibleClick(self);

  UDOuterWidth.Position := round(FrameElementPercents[2]);
  UDMiddleWidth.Position := round(FrameElementPercents[1]);
  UDInnerWidth.Position := round(FrameElementPercents[0]);
  UDWidth.Position := Series1.Frame.Width;
end;

procedure TPieFrameBorderForm.cbFrameVisibleClick(Sender: TObject);
begin
  Series1.Frame.Visible := cbFrameVisible.Checked;
end;

procedure TPieFrameBorderForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
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

procedure TPieFrameBorderForm.EInnerWidthChange(Sender: TObject);
var val : integer;
    appOuter,appMiddle,appInner : double;
begin
  if (not isChanging) then
  begin
    isChanging := true;

    if (sender = UDOuterWidth) then
    begin
      val := round(UDOuterWidth.Position);
      FrameElementPercents[2] := val;
    end
    else if (sender = UDMiddleWidth) then begin
      val := round(UDMiddleWidth.Position);
      FrameElementPercents[1] := val;
      end
      else begin
        val := round(UDInnerWidth.Position);
        FrameElementPercents[0] := val;
      end;

        appOuter := FrameElementPercents[2];
        appMiddle := FrameElementPercents[1];
        appInner := FrameElementPercents[0];

        RationaliseValues(appInner, appMiddle, appOuter);

        UDOuterWidth.Position := Round(appOuter);
        UDMiddleWidth.Position := Round(appMiddle);
        UDMiddleWidth.Position := Round(appInner);

        isChanging := false;
  end;

  Series1.Repaint;
end;

procedure TPieFrameBorderForm.EFWidthChange(Sender: TObject);
begin
  Series1.Frame.Width := Round(UDWidth.Position);
  Series1.RefreshSeries;
end;

initialization
  RegisterClass(TPieFrameBorderForm);

end.
