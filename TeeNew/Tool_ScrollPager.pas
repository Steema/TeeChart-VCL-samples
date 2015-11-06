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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeScrollPagerTool, Series,
  TeeGDIPlus;


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
  TeeThemes, Math, TeeTools, EditChar;

procedure TTool_ScrollPagerForm.FormCreate(Sender: TObject);
var i: Integer;
    tmpFast : TFastLineSeries;
begin
  inherited;

  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('ScrollPager Tool');

  for i:=0 to 3 do
  begin
    tmpFast:=TFastLineSeries.Create(Self);
    tmpFast.DrawStyle:=flAll;

    tmpFast.FillSampleValues(1000);

    Chart1.AddSeries(tmpFast);
  end;

  // Create the Scroll Pager Tool
  // This can be also done at design-time using the Chart Editor -> Tools tab,
  // and so this code is not necessary at all.

  ScrollPagerTool := TScrollPagerTool.Create(Self);
  ScrollPagerTool.ParentChart:=Chart1;
  ScrollPagerTool.SubChartTChart.Frame.Visible:=False;

  ScrollPagerTool.ColorBandTool.StartLine.Active:=True;
  ScrollPagerTool.ColorBandTool.EndLine.Active:=True;

  // No longer necessary to create a GDI+ canvas.
  // GDI+ is now the default canvas:
  (*
  ScrollPagerTool.SubChartTChart.Canvas:=TGDIPlusCanvas.Create;
  (ScrollPagerTool.SubChartTChart.Canvas as TGDIPlusCanvas).AntiAlias:=True;
  *)

  ScrollPagerTool.AddSeries(Chart1[0]);
  ScrollPagerTool.AddSeries(Chart1[2]);

  // Cosmetics
  ApplyChartTheme(TBlackIsBackTheme,Chart1);
  ApplyChartTheme(TBlackIsBackTheme,ScrollPagerTool.SubChartTChart);

  Chart1.View3D:=False;
  ScrollPagerTool.SubChartTChart.View3D:=False;
end;

procedure TTool_ScrollPagerForm.FormResize(Sender: TObject);
begin
  inherited;

  // Reset scroller dimensions on form resize:
  ScrollPagerTool.SetUpScrollPager;
end;

procedure TTool_ScrollPagerForm.Button1Click(Sender: TObject);
begin
  EditChar.EditChartTool(Self, ScrollPagerTool);
end;

initialization
  RegisterClass(TTool_ScrollPagerForm);
end.
