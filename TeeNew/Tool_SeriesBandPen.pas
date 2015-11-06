unit Tool_SeriesBandPen;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeePenDlg,
  TeeTools, TeeSeriesBandTool;

type
  TToolSeriesBandPen = class(TBaseForm)
    BPen: TButtonPen;
    CBDrawBehindSeries: TCheckBox;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CBDrawBehindSeriesClick(Sender: TObject);
  private
    { Private declarations }
    SeriesBand : TSeriesBandTool;
    Line1,
    Line2 : TlineSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  EditChar;

procedure TToolSeriesBandPen.FormCreate(Sender: TObject);
begin
  inherited;

  Line1:=TLineSeries.Create(self);
  Chart1.AddSeries(line1);

  Line2:=TLineSeries.Create(self);
  Chart1.AddSeries(line2);

  Line1.FillSampleValues(10);
  Line2.FillSampleValues(10);

  SeriesBand:=TSeriesBandTool.Create(Self);

  with SeriesBand do
  begin
    ParentChart:=Chart1;
    Series:=Line1;
    Series2:=Line2;
    Gradient.EndColor:=clPurple;
    Gradient.Visible:=True;
    Pen.Visible:=True;
    Pen.Width:=5;
    Pen.Color:=clRed;
  end;

  BPen.LinkPen(SeriesBand.Pen);
end;

procedure TToolSeriesBandPen.Button2Click(Sender: TObject);
begin
  EditChartTool(Self,SeriesBand);
end;

procedure TToolSeriesBandPen.CBDrawBehindSeriesClick(Sender: TObject);
begin
  SeriesBand.DrawBehindSeries:=CBDrawBehindSeries.Checked;
end;

initialization
  RegisterClass(TToolSeriesBandPen);
end.
