unit Filter_Resize;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeAntiAlias, TeeTools,
  TeeFilters;

type
  TFilterResize = class(TBaseForm)
    ChartTool1: TAnnotationTool;
    Label1: TLabel;
    tbWidth: TEdit;
    udWidth: TUpDown;
    Label2: TLabel;
    tbHeight: TEdit;
    udHeight: TUpDown;
    ChartTool2: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure tbWidthChange(Sender: TObject);
    procedure tbHeightChange(Sender: TObject);
  private
    { Private declarations }
    ResizeFilter : TResizeFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterResize.FormCreate(Sender: TObject);
begin
  inherited;

  ResizeFilter := TResizeFilter.Create(ChartTool2.Filters);

  with ResizeFilter do
  begin
    Width:=600;
    Height:=500;
  end;
end;

procedure TFilterResize.tbWidthChange(Sender: TObject);
begin
  ResizeFilter.Width:=udWidth.Position;
  Chart1.Repaint;
end;

procedure TFilterResize.tbHeightChange(Sender: TObject);
begin
  ResizeFilter.Height:=udHeight.Position;
  Chart1.Repaint;
end;

initialization
  RegisterClass(TFilterResize);
end.
