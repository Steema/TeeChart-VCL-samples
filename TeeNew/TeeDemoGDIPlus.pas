unit TeeDemoGDIPlus;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  TeEngine, Series, TeeProcs, Chart, TeeGDIPlus, TeeTools, TeeComma, TeCanvas,
  Base;

// Sample project showing the TGDIPlusCanvas to render TeeChart
// controls using Microsoft GDI+ Plus dlls.

type
  TGDIPlusForm = class(TBaseForm)
    Series1: TBarSeries;
    ChartTool1: TRotateTool;
    TeeCommander1: TTeeCommander;
    ChartTool2: TAnnotationTool;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    CBAliasText: TComboFlat;
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBAliasTextChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    g: TGDIPlusCanvas;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TGDIPlusForm.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
     Chart1.Canvas:=TTeeCanvas3D.Create  // normal GDI canvas
  else
  begin
    // Create and set GDI Plus canvas.
    // This new canvas will be automatically destroyed when the chart
    // is freed.

    g:=TGDIPlusCanvas.Create;

    Chart1.Canvas:=g;

    // Some options for GDI Plus canvas
    g.AntiAlias:=CheckBox1.Checked;
    g.AntiAliasText:=TGDIPlusFontQuality(CBAliasText.ItemIndex);
  end;

  CheckBox1.Enabled:=RadioGroup1.ItemIndex=1;
  CBAliasText.Enabled:=RadioGroup1.ItemIndex=1;

  // Change annotation text:
  if RadioGroup1.ItemIndex=0 then
     ChartTool2.Text:='GDI Canvas'
  else
     ChartTool2.Text:='GDI+ Canvas';
end;

procedure TGDIPlusForm.CheckBox1Click(Sender: TObject);
begin
  g.AntiAlias:=CheckBox1.Checked;
end;

procedure TGDIPlusForm.FormCreate(Sender: TObject);
begin
  Series1.BarPen.Width:=2;
  RadioGroup1Click(Self);
end;

procedure TGDIPlusForm.CBAliasTextChange(Sender: TObject);
begin
  g.AntiAliasText:=TGDIPlusFontQuality(CBAliasText.ItemIndex);
end;

initialization
  RegisterClass(TGDIPlusForm);
end.
