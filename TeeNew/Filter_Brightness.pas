unit Filter_Brightness;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, 

  jpeg,

  TeeFilters, TeeGDIPlus;

type
  TFilterBrightness = class(TBaseForm)
    Series1: TLineSeries;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    cbPercent: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure cbPercentClick(Sender: TObject);
  private
    { Private declarations }
    BrightnessFilter: TBrightnessFilter;
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

procedure TFilterBrightness.FormCreate(Sender: TObject);
begin
  inherited;

  BrightnessFilter := TBrightnessFilter.Create(Chart1.BackImage.Filters);

  with BrightnessFilter do
  begin
    Amount := 10;
    Percent:= False;
    ScrollBar1.Position:=Amount;
  end;
end;

procedure TFilterBrightness.ScrollBar1Change(Sender: TObject);
begin
  BrightnessFilter.Amount:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(ScrollBar1.Position);
  Chart1.Invalidate;
end;

procedure TFilterBrightness.cbPercentClick(Sender: TObject);
begin
  BrightnessFilter.Percent:=cbPercent.Checked;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterBrightness);
end.
