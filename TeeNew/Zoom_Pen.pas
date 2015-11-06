unit Zoom_Pen;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeePenDlg, TeCanvas;

type
  TZoomPen = class(TBaseForm)
    Series1: TFastLineSeries;
    ButtonPen1: TButtonPen;
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TZoomPen.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.Zoom.Pen.Color  := clLime;
  Chart1.Zoom.Pen.Width  := 2;
  Chart1.Zoom.Brush.Style:= bsSolid;
  Chart1.Zoom.Brush.Color:= clBlue;

  ButtonPen1.LinkPen(Chart1.Zoom.Pen);

  Series1.FillSampleValues(200);
end;

procedure TZoomPen.Button1Click(Sender: TObject);
begin
  EditChartBrush(Self,Chart1.Zoom.Brush);
end;

initialization
  RegisterClass(TZoomPen);
end.
