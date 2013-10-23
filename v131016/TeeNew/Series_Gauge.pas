unit Series_Gauge;
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
  Base, TeEngine, Series, TeeGauges, TeeProcs, Chart;

type
  TGaugeDemo = class(TBaseForm)
    Series1: TGaugeSeries;
    Button1: TButton;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Series1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses EditChar;

procedure TGaugeDemo.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);

  // fix scrollbar
  ScrollBar1.Min:=Round(Series1.Minimum);
  ScrollBar1.Max:=Round(Series1.Maximum);
  ScrollBar1.Position:=Round(Series1.Value);

  Label2.Caption:=FloatToStr(Series1.Value);
end;

procedure TGaugeDemo.ScrollBar1Change(Sender: TObject);
begin
  Series1.Value:=ScrollBar1.Position;
end;

procedure TGaugeDemo.Series1Change(Sender: TObject);
begin
  Label2.Caption:=FloatToStr(Series1.Value);
end;


procedure TGaugeDemo.FormCreate(Sender: TObject);
begin
  inherited;
  ScrollBar1.Position:=Round(Series1.Value);
  Label2.Caption:=FloatToStr(Round(Series1.Value));
end;

initialization
  RegisterClass(TGaugeDemo);
end.
