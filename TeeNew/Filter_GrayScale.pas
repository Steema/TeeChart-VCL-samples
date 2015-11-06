unit Filter_GrayScale;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeFilters, TeCanvas,
  TeeAntiAlias;

type
  TFilterGrayScale = class(TBaseForm)
    Series1: TPieSeries;
    cbActive: TCheckBox;
    cbMethod: TComboFlat;
    ChartTool1: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure cbMethodChange(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
  private
    { Private declarations }
    GrayScaleFilter: TGrayScaleFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterGrayScale.FormCreate(Sender: TObject);
begin
  inherited;

  GrayScaleFilter := TGrayScaleFilter.Create(ChartTool1.Filters);
  GrayScaleFilter.Method:=gmSimple;

  cbMethod.ItemIndex:=0;
end;

procedure TFilterGrayScale.cbMethodChange(Sender: TObject);
begin
  GrayScaleFilter.Method:=TGrayMethod(cbMethod.ItemIndex);
  Invalidate;
end;

procedure TFilterGrayScale.cbActiveClick(Sender: TObject);
begin
  ChartTool1.Active:=cbActive.Checked;
  cbMethod.Enabled:=cbActive.Checked;
end;

initialization
  RegisterClass(TFilterGrayScale);
end.

