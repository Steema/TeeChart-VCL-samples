unit SeriesType_CircularGauge;
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
  Base, TeEngine, TeeNumericGauge, TeeLinearGauge, TeeCircularGauge,
  TeeProcs, Chart;

type
  TSeriesCircularGauge = class(TBaseForm)
    Series1: TCircularGauge;
    Button1: TButton;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    ScrollBar2: TScrollBar;
    Label2: TLabel;
    ScrollBar3: TScrollBar;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
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

uses
  EditChar;
  
procedure TSeriesCircularGauge.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TSeriesCircularGauge.ScrollBar1Change(Sender: TObject);
begin
  Label1.Caption:=IntToStr(ScrollBar1.Position);
  Series1.Value:=ScrollBar1.Position;
end;

procedure TSeriesCircularGauge.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Value:=Random(100);

  ScrollBar1.Position:=Round(Series1.Value);
  Label1.Caption:=IntToStr(ScrollBar1.Position);
end;

procedure TSeriesCircularGauge.ScrollBar2Change(Sender: TObject);
begin
  Series1.RotationAngle:=ScrollBar2.Position
end;

procedure TSeriesCircularGauge.ScrollBar3Change(Sender: TObject);
begin
  Series1.TotalAngle:=ScrollBar3.Position
end;

initialization
  RegisterClass(TSeriesCircularGauge);
end.
