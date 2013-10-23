unit Filter_Invert;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeAntiAlias, TeeSurfa,
  TeeFilters;

type
  TFilterInvert = class(TBaseForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbActive: TCheckBox;
    EditLeft: TEdit;
    EditTop: TEdit;
    EditWidth: TEdit;
    EditHeight: TEdit;
    Series1: TIsoSurfaceSeries;
    UpLeft: TUpDown;
    UpWidth: TUpDown;
    UpTop: TUpDown;
    UpHeight: TUpDown;
    ChartTool1: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
    procedure EditLeftChange(Sender: TObject);
    procedure EditWidthChange(Sender: TObject);
    procedure EditTopChange(Sender: TObject);
    procedure EditHeightChange(Sender: TObject);
  private
    { Private declarations }
    InvertFilter: TInvertFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterInvert.FormCreate(Sender: TObject);
begin
  inherited;

  // Force chart to redraw and automatically calculate the ChartRect public variable.
  Chart1.Draw;

  // Example: Create a TInvertFilter
  InvertFilter := TInvertFilter.Create(ChartTool1.Filters);

  with InvertFilter.Region do
  begin
    Rectangle:=Chart1.ChartRect;

    UpLeft.Position:=Left;
    UpWidth.Position:=Width;
    UpTop.Position:=Top;
    UpHeight.Position:=Height;
  end;
end;

procedure TFilterInvert.cbActiveClick(Sender: TObject);
begin
  ChartTool1.Active:=cbActive.Checked;
end;

procedure TFilterInvert.EditLeftChange(Sender: TObject);
begin
  InvertFilter.Region.Left:=UpLeft.Position;
  Chart1.Invalidate;
end;

procedure TFilterInvert.EditWidthChange(Sender: TObject);
begin
  InvertFilter.Region.Width:=UpWidth.Position;
  Chart1.Invalidate;
end;

procedure TFilterInvert.EditTopChange(Sender: TObject);
begin
  InvertFilter.Region.Top:=UpTop.Position;
  Chart1.Invalidate;
end;

procedure TFilterInvert.EditHeightChange(Sender: TObject);
begin
  InvertFilter.Region.Height:=UpHeight.Position;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterInvert);
end.

