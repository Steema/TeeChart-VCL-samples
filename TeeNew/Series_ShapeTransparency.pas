unit Series_ShapeTransparency;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeShape;

type
  TSeriesShapeTransparency = class(TBaseForm)
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Series1: TChartShape;
    Series2: TPieSeries;
    Series3: TChartShape;
    Label4: TLabel;
    ScrollBar2: TScrollBar;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboFlat1: TComboFlat;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
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

procedure TSeriesShapeTransparency.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.Transparency:=50;
  Series3.Transparency:=50;
end;

procedure TSeriesShapeTransparency.ScrollBar1Change(Sender: TObject);
begin
  Series1.Transparency:=ScrollBar1.Position;
end;

procedure TSeriesShapeTransparency.ScrollBar2Change(Sender: TObject);
begin
  Series3.Transparency:=ScrollBar2.Position;
end;

procedure TSeriesShapeTransparency.ComboFlat1Change(Sender: TObject);
var tmp : TChartSeries;
begin
  case ComboFlat1.ItemIndex of
    0: tmp:=Series3;
    1: tmp:=Series2;
  else
    //2:
    tmp:=Series1;
  end;

  if tmp <> Chart1.SeriesList.Last then
     Chart1.ExchangeSeries(tmp,Chart1.SeriesList.Last);
end;

initialization
  RegisterClass(TSeriesShapeTransparency);
end.
