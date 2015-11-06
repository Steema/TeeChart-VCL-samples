unit Zoom_History;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeePenDlg, TeCanvas, TeeTools;

type
  TZoomHistory = class(TBaseForm)
    Series1: TFastLineSeries;
    ButtonPen1: TButtonPen;
    Button1: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    ChartTool1: TGridBandTool;
    ZoomLevel: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart1Zoom(Sender: TObject);
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

Uses TeeBrushDlg;

procedure TZoomHistory.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.Zoom.Pen.Color  := RGB(176,196,222);
  Chart1.Zoom.Pen.Width  := 2;
  Chart1.Zoom.Brush.Style:= bsSolid;
  Chart1.Zoom.Brush.Color:= clDkGray;
  Chart1.Zoom.History:=True;

  ButtonPen1.LinkPen(Chart1.Zoom.Pen);

  Series1.FillSampleValues(50);
end;

procedure TZoomHistory.Button1Click(Sender: TObject);
begin
  EditChartBrush(Self,Chart1.Zoom.Brush);
end;

procedure TZoomHistory.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.Zoom.History:=CheckBox1.Checked;
end;

procedure TZoomHistory.Chart1Zoom(Sender: TObject);
begin
  ZoomLevel.Caption:=IntToStr(Chart1.Zoom.AxesHistory.Count);
end;

initialization
  RegisterClass(TZoomHistory);
end.
