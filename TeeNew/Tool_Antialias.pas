unit Tool_Antialias;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}

  jpeg,

  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeFilters,
  TeeFiltersEditor, TeeAntiAlias, TeeGDIPlus;

type
  TAntialiasToolForm = class(TBaseForm)
    Label1: TLabel;
    ChartTool1: TRotateTool;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TAreaSeries;
    CheckBox1: TCheckBox;
    ScrollBar1: TScrollBar;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    hueFilter: THueLumSatFilter;
    antialiasTool: TAntiAliasTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAntialiasToolForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.Border.Visible:=True;
  antialiasTool:=TAntiAliasTool.Create(Self);
  Chart1.Tools.Add(antialiasTool);

  hueFilter:=THueLumSatFilter.Create(antialiasTool.Filters);
  hueFilter.Hue:=0;
end;

procedure TAntialiasToolForm.ScrollBar1Change(Sender: TObject);
begin
  hueFilter.Hue:=ScrollBar1.Position;
  Chart1.Invalidate;
end;

procedure TAntialiasToolForm.CheckBox1Click(Sender: TObject);
begin
  antialiasTool.AntiAlias:=CheckBox1.Checked;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TAntialiasToolForm);
end.
