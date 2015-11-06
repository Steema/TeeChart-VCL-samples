unit Filter_Crop;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeAntiAlias, TeeFilters;

type
  TFilterCrop = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TPointSeries;
    ChartTool1: TAntiAliasTool;
    Label1: TLabel;
    tbWidth: TEdit;
    udWidth: TUpDown;
    Label2: TLabel;
    tbHeight: TEdit;
    udHeight: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure tbWidthChange(Sender: TObject);
    procedure tbHeightChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    CropFilter : TCropFilter;    
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterCrop.FormCreate(Sender: TObject);
begin
  inherited;

  CropFilter := TCropFilter.Create(ChartTool1.Filters);

  with CropFilter do
  begin
    Width:=250;
    Height:=200;
  end;
end;

procedure TFilterCrop.tbWidthChange(Sender: TObject);
begin
  CropFilter.Width:=udWidth.Position;
  Chart1.Invalidate;
end;

procedure TFilterCrop.tbHeightChange(Sender: TObject);
begin
  CropFilter.Height:=udHeight.Position;
  Chart1.Invalidate;
end;

procedure TFilterCrop.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TFilterCrop);
end.

