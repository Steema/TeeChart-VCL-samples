unit Chart_CustomChartRect;
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
  {$IFDEF D6}
  Types,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeTools, TeeGDIPlus;

type
  TChartCustomChartRect = class(TBaseForm)
    Series1: TBarSeries;
    bCustom: TButton;
    ChartTool1: TRectangleTool;
    ChartTool2: TRotateTool;
    procedure bCustomClick(Sender: TObject);
    procedure ChartTool1Dragged(Sender: TObject);
    procedure ChartTool1Resized(Sender: TObject);
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

procedure TChartCustomChartRect.bCustomClick(Sender: TObject);
begin
  with Chart1 do
  begin
    Title.CustomPosition:=True;
    Legend.CustomPosition:=True;

    CustomChartRect:=True;
    ChartRect:=TeeRect(50,50,200,200);
    Axes.Left.LabelsSize:=-10;
    Axes.Bottom.LabelsSize:=-10;
  end;

  with ChartTool1 do
  begin
    Active:=True;
    Bounds:=Chart1.ChartRect;
  end;
end;

procedure TChartCustomChartRect.ChartTool1Dragged(Sender: TObject);
begin
  Chart1.SetChartRect(ChartTool1.Bounds);
end;

procedure TChartCustomChartRect.ChartTool1Resized(Sender: TObject);
begin
  Chart1.SetChartRect(ChartTool1.Bounds);
end;

initialization
  RegisterClass(TChartCustomChartRect);
end.
