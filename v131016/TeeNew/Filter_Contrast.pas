unit Filter_Contrast;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeFilters, TeeAntiAlias;

type
  TFilterContrast = class(TBaseForm)
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    cbPercent: TCheckBox;
    Series1: TBarSeries;
    ChartTool1: TAntiAliasTool;
    bFilters: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure cbPercentClick(Sender: TObject);
    procedure bFiltersClick(Sender: TObject);
  private
    { Private declarations }
    ContrastFilter: TContrastFilter;
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
  TeeFiltersEditor;

procedure TFilterContrast.FormCreate(Sender: TObject);
begin
  inherited;

  ContrastFilter := TContrastFilter.Create(ChartTool1.Filters);

  with ContrastFilter do
  begin
    Amount := 10;
    Percent:= False;
    ScrollBar1.Position:=Amount;
  end;
end;

procedure TFilterContrast.ScrollBar1Change(Sender: TObject);
begin
  ContrastFilter.Amount:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(ScrollBar1.Position);
  Chart1.Invalidate;
end;

procedure TFilterContrast.cbPercentClick(Sender: TObject);
begin
  ContrastFilter.Percent:=cbPercent.Checked;
  Chart1.Invalidate;
end;

procedure TFilterContrast.bFiltersClick(Sender: TObject);
begin
  if ShowFiltersEditor(Self, ChartTool1.Bitmap, ChartTool1.Filters) then
     ChartTool1.Repaint;
end;

initialization
  RegisterClass(TFilterContrast);
end.

