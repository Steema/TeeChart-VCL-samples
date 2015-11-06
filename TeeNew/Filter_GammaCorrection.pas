unit Filter_GammaCorrection;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeAntiAlias,
  TeeTools, GanttCh, TeeFilters;

type
  TFilterGammaCorrection = class(TBaseForm)
    Series1: TGanttSeries;
    ChartTool1: TGridBandTool;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    cbPercent: TCheckBox;
    ChartTool2: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure cbPercentClick(Sender: TObject);
  private
    { Private declarations }
    GammaCorrectionFilter: TGammaCorrectionFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterGammaCorrection.FormCreate(Sender: TObject);
begin
  inherited;

  GammaCorrectionFilter := TGammaCorrectionFilter.Create(ChartTool2.Filters);

  with GammaCorrectionFilter do
  begin
    Amount := 50;
    Percent:= False;
  end;
end;

procedure TFilterGammaCorrection.ScrollBar1Change(Sender: TObject);
begin
  GammaCorrectionFilter.Amount:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(ScrollBar1.Position);
  Chart1.Invalidate;
end;

procedure TFilterGammaCorrection.cbPercentClick(Sender: TObject);
begin
  if CBPercent.Checked then
     ScrollBar1.Max:=100
  else
     ScrollBar1.Max:=255;

  ScrollBar1Change(Self);

  GammaCorrectionFilter.Percent:=cbPercent.Checked;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterGammaCorrection);
end.
