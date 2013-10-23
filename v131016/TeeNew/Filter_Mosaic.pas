unit Filter_Mosaic;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeFilters,
  TeeAntiAlias, TeeSurfa;

type
  TFilterMosaic = class(TBaseForm)
    ChartTool1: TAntiAliasTool;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    cbPercent: TCheckBox;
    Series1: TTowerSeries;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure cbPercentClick(Sender: TObject);
  private
    { Private declarations }
    MosaicFilter: TMosaicFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterMosaic.FormCreate(Sender: TObject);
begin
  inherited;

  MosaicFilter := TMosaicFilter.Create(ChartTool1.Filters);

  with MosaicFilter do
  begin
    Amount := 6;
    Percent:= False;
    ScrollBar1.Position:=Amount;
  end;
end;

procedure TFilterMosaic.ScrollBar1Change(Sender: TObject);
begin
  MosaicFilter.Amount:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(ScrollBar1.Position);
  Chart1.Invalidate;
end;

procedure TFilterMosaic.cbPercentClick(Sender: TObject);
begin
  MosaicFilter.Percent:=cbPercent.Checked;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterMosaic);
end.
