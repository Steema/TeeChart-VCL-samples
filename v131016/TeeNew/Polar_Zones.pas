unit Polar_Zones;
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
  TeeEdiGrad, Base, TeEngine, Series, TeePolar, TeeProcs, Chart;

type
  TPolarZones = class(TBaseForm)
    Series1: TPolarSeries;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Series1BeforeDrawValues(Sender: TObject);
  private
    { Private declarations }
    procedure DrawPolarZones;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}


procedure TPolarZones.DrawPolarZones;
begin
  if Series1.CircleXCenter<>0 then
  begin
    // Hide pen
    Chart1.Canvas.Pen.Style:=psClear;

    // Draw three zones (green, yellow and red)

    Chart1.Canvas.Brush.Color:=clGreen;
    Series1.DrawZone(0,100,Chart1.Width3D);

    Chart1.Canvas.Brush.Color:=clYellow;
    Series1.DrawZone(100,300,Chart1.Width3D);

    Chart1.Canvas.Brush.Color:=clRed;
    Series1.DrawZone(300,700,Chart1.Width3D);

    // Prepare Pen

    with Chart1.Canvas.Pen do
    begin
      Color:=clWhite;
      Width:=2;
      Style:=psSolid;
    end;

    // Draw "ring" at 300

    Series1.DrawRing(300,Chart1.Width3D);
  end;
end;


procedure TPolarZones.Button1Click(Sender: TObject);
begin
  EditTeeGradient(Self,Series1.CircleGradient);
end;

procedure TPolarZones.CheckBox1Click(Sender: TObject);
begin
  Chart1.Invalidate;
end;

procedure TPolarZones.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.Clear;
  Series1.AddPolar(30,100);
  Series1.AddPolar(45,150);
  Series1.AddPolar(60,-90);
  Series1.AddPolar(80,300);
  Series1.AddPolar(130,400);
  Series1.AddPolar(170,250);
  Series1.AddPolar(230,100);
  Series1.AddPolar(260,120);
  Series1.AddPolar(330,700); 
end;

procedure TPolarZones.Series1BeforeDrawValues(Sender: TObject);
begin
  if CheckBox1.Checked then 
     DrawPolarZones;
end;

initialization
  RegisterClass(TPolarZones);
end.
