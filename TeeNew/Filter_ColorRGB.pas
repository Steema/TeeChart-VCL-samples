unit Filter_ColorRGB;
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
  TFilterColorRGB = class(TBaseForm)
    Series1: TPieSeries;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sbRed: TScrollBar;
    sbGreen: TScrollBar;
    sbBlue: TScrollBar;
    bFilters: TButton;
    procedure FormCreate(Sender: TObject);
    procedure sbRedChange(Sender: TObject);
    procedure sbGreenChange(Sender: TObject);
    procedure sbBlueChange(Sender: TObject);
    procedure bFiltersClick(Sender: TObject);
  private
    { Private declarations }
    ColorFilter: TColorFilter;
    AntialiasTool : TAntiAliasTool;
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

procedure TFilterColorRGB.FormCreate(Sender: TObject);
begin
  inherited;

  // Adding tool to Chart
  AntialiasTool := TAntiAliasTool.Create(self);

  AntialiasTool.ParentChart:=Chart1;
  Chart1.Tools.Add(AntialiasTool);

  // Adding Color filter
  ColorFilter := TColorFilter.Create(AntialiasTool.Filters);

  with ColorFilter do
  begin
    Red := 100;
    Green := 100;
    Blue := 100;
  end;
end;

procedure TFilterColorRGB.sbRedChange(Sender: TObject);
begin
  ColorFilter.Red:=sbRed.Position;
  Chart1.Invalidate;
end;

procedure TFilterColorRGB.sbGreenChange(Sender: TObject);
begin
  ColorFilter.Green:=sbGreen.Position;
  Chart1.Invalidate;
end;

procedure TFilterColorRGB.sbBlueChange(Sender: TObject);
begin
  ColorFilter.Blue:=sbBlue.Position;
  Chart1.Invalidate;
end;

procedure TFilterColorRGB.bFiltersClick(Sender: TObject);
begin
  if ShowFiltersEditor(Self,AntialiasTool.Bitmap,AntialiasTool.Filters) then
     AntialiasTool.Repaint;
end;

initialization
  RegisterClass(TFilterColorRGB);
end.
