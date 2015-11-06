unit Bar_3DDepth;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QImgList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  ImgList,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeeTools;

type
  TBar3DDepth = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    ScrollBar2: TScrollBar;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
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

procedure TBar3DDepth.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;

  Chart1.SeriesList.FillSampleValues;

  for t:=0 to Chart1.SeriesCount-1 do
  begin
    (Chart1[t] as TBarSeries).DepthPercent:=40;
    (Chart1[t] as TBarSeries).BarWidthPercent:=40;
  end;

  ScrollBar1.Position:=Series1.DepthPercent;
  ScrollBar2.Position:=Series1.BarWidthPercent;
end;

procedure TBar3DDepth.ScrollBar1Change(Sender: TObject);
begin
  Series1.DepthPercent:=ScrollBar1.Position;
  Series2.DepthPercent:=ScrollBar1.Position;
  Series3.DepthPercent:=ScrollBar1.Position;
  Series4.DepthPercent:=ScrollBar1.Position;
  Series5.DepthPercent:=ScrollBar1.Position;
end;

procedure TBar3DDepth.ScrollBar2Change(Sender: TObject);
begin
  Series1.BarWidthPercent:=ScrollBar2.Position;
  Series2.BarWidthPercent:=ScrollBar2.Position;
  Series3.BarWidthPercent:=ScrollBar2.Position;
  Series4.BarWidthPercent:=ScrollBar2.Position;
  Series5.BarWidthPercent:=ScrollBar2.Position;
end;

initialization
  RegisterClass(TBar3DDepth);
end.
