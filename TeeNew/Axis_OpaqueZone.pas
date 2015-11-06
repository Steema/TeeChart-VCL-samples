unit Axis_OpaqueZone;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TAxisOpaqueZone = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Series3: TLineSeries;
    ChartTool1: TColorLineTool;
    ChartTool2: TColorLineTool;
    ChartTool3: TColorLineTool;
    CheckBox1: TCheckBox;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
  private
    { Private declarations }
    procedure SeriesAfterDraw(Sender: TObject);
    procedure SeriesBeforeDraw(Sender: TObject);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAxisOpaqueZone.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(100);

  { set series events (can also be done with the Object Inspector) }
  Series1.BeforeDrawValues:=SeriesBeforeDraw;
  Series2.BeforeDrawValues:=SeriesBeforeDraw;
  Series3.BeforeDrawValues:=SeriesBeforeDraw;
  Series4.BeforeDrawValues:=SeriesBeforeDraw;

  Series1.AfterDrawValues:=SeriesAfterDraw;
  Series2.AfterDrawValues:=SeriesAfterDraw;
  Series3.AfterDrawValues:=SeriesAfterDraw;
  Series4.AfterDrawValues:=SeriesAfterDraw;
end;

procedure TAxisOpaqueZone.SeriesBeforeDraw(Sender: TObject);

  Function SeriesRect(Series:TChartSeries):TRect;
  begin
    With result do
    begin
      Left:=Series.GetHorizAxis.IStartPos;
      Right:=Series.GetHorizAxis.IEndPos;
      Top:=Series.GetVertAxis.IStartPos;
      Bottom:=Series.GetVertAxis.IEndPos;
    end;
  end;

begin
  { make opaque }
  if CheckBox1.Checked then
  With Chart1 do
       if CanClip then
          Canvas.ClipRectangle(SeriesRect( Sender as TChartSeries ));
end;

procedure TAxisOpaqueZone.SeriesAfterDraw(Sender: TObject);
begin
  if CheckBox1.Checked then Chart1.Canvas.UnClipRectangle;
end;

procedure TAxisOpaqueZone.CheckBox1Click(Sender: TObject);
begin
  Chart1.Repaint;
end;

procedure TAxisOpaqueZone.ScrollBar1Change(Sender: TObject);

  Procedure DoScroll(Series:TChartSeries);
  var tmp : Double;
  begin
    With Series,YValues do
    begin
      tmp:=(ScrollBar1.Position-50)*(MaxValue-MinValue)/100;
      GetVertAxis.SetMinMax(MaxValue+tmp,MinValue+tmp);
    end;
  end;

begin
  DoScroll(Series1);
  DoScroll(Series2);
  DoScroll(Series3);
  DoScroll(Series4);
end;

initialization
  RegisterClass(TAxisOpaqueZone);
end.
