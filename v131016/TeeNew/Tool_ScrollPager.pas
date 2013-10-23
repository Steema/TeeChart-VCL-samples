unit Tool_ScrollPager;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QImgList, QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList,
  Grids,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeScrollPagerTool, Series;


type
  TTool_ScrollPagerForm = class(TBaseForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ScrollPagerTool : TScrollPagerTool;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeThemes, Math, TeeTools, EditChar, TeeGDIPlus;

procedure TTool_ScrollPagerForm.FormCreate(Sender: TObject);
var i: Integer;
begin
  inherited;

  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('ScrollPager Tool');

  for i:=0 to 3 do
    Chart1.AddSeries(TFastLineSeries).FillSampleValues(1000);

  // Create the Scroll Pager Tool
  ScrollPagerTool := TScrollPagerTool.Create(Self);
  ScrollPagerTool.ParentChart:=Chart1;
  ScrollPagerTool.SubChartTChart.Frame.Visible:=false;
  ScrollPagerTool.SubChartTChart.BevelInner:=bvNone;
  ScrollPagerTool.SubChartTChart.BevelOuter:=bvNone;

  ScrollPagerTool.SubChartTChart.Canvas:=TGDIPlusCanvas.Create;
  (ScrollPagerTool.SubChartTChart.Canvas as TGDIPlusCanvas).AntiAlias:=True;

  ApplyChartTheme(TBlackIsBackTheme,TCustomChart(Chart1));
  ApplyChartTheme(TBlackIsBackTheme,TCustomChart(ScrollPagerTool.SubChartTChart));

  ScrollPagerTool.AddSeries(Chart1[0]);
  ScrollPagerTool.AddSeries(Chart1[2]);
end;

procedure TTool_ScrollPagerForm.FormResize(Sender: TObject);
begin
  inherited;

  ScrollPagerTool.SetUpScrollPager;
end;

procedure TTool_ScrollPagerForm.Button1Click(Sender: TObject);
begin
  inherited;
  EditChar.EditChartTool(Self, ScrollPagerTool);
end;

initialization
  RegisterClass(TTool_ScrollPagerForm);
end.
