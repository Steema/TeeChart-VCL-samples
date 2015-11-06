unit SeriesType_Darvas;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart,
  TeeTools, CandleCh, OHLChart, TeCanvas, TeePenDlg, TeeBrushDlg,
  TeeGDIPlus;

type
  TSeriesTypeDarvas = class(TBaseForm)
    Darvas: TDarvasSeries;
    GridBandTool1: TGridBandTool;
    bEdit: TButton;
    Button1: TButton;
    LabelBoxes: TLabel;
    TrackBar1: TTrackBar;
    ButtonPen1: TButtonPen;
    Button2: TButton;
    ChartTool1: TRectangleTool;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Box : Integer;
    procedure FillSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses
  EditChar;

procedure TSeriesTypeDarvas.FormCreate(Sender: TObject);
begin
  inherited;

  Box:=-1;
  FillSeries;

  ButtonPen1.LinkPen(Darvas.BoxPen);

  TrackBar1.Position:=Darvas.Transparency;
end;

procedure TSeriesTypeDarvas.FillSeries;
begin
  Darvas.FillSampleValues(40);
end;

procedure TSeriesTypeDarvas.bEditClick(Sender: TObject);
begin
  EditSeries(Self,Darvas);
end;

procedure TSeriesTypeDarvas.Button1Click(Sender: TObject);
begin
  FillSeries;
end;

procedure TSeriesTypeDarvas.Chart1AfterDraw(Sender: TObject);
begin
  LabelBoxes.Caption:='Boxes: '+IntToStr(Darvas.NumBoxes);
end;

procedure TSeriesTypeDarvas.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmp : Integer;
begin
  tmp:=Darvas.ClickedBox(x,y);

  ChartTool1.Visible:=tmp<>-1;

  if ChartTool1.Visible then
     ChartTool1.Bounds:=Darvas.BoxesRect[tmp];
end;

procedure TSeriesTypeDarvas.TrackBar1Change(Sender: TObject);
begin
  Darvas.Transparency:=TrackBar1.Position;
end;

procedure TSeriesTypeDarvas.Button2Click(Sender: TObject);
begin
  EditChartBrush(Self,Darvas.BoxBrush);
end;

initialization
  RegisterClass(TSeriesTypeDarvas);
end.
