unit Legend_TextSymbolGap;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeTools, TeeAntiAlias;


type
  TLegendTextSymbolGapForm = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    cbAutomaticWidths: TCheckBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Edit3: TEdit;
    UpDown3: TUpDown;
    Series1: TLineSeries;
    Label3: TLabel;
    ChartTool1: TGridBandTool;
    ChartTool2: TAntiAliasTool;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbAutomaticWidthsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LegendTextSymbolGapForm: TLegendTextSymbolGapForm;  

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TLegendTextSymbolGapForm.Edit1Change(Sender: TObject);
begin
  Chart1.Legend.ColumnWidths[0]:=StrToInt(Edit1.Text);
  Chart1.Refresh;
end;

procedure TLegendTextSymbolGapForm.Edit2Change(Sender: TObject);
begin
  Chart1.Legend.ColumnWidths[1]:=StrToInt(Edit2.Text);
  Chart1.Refresh;
end;

procedure TLegendTextSymbolGapForm.Edit3Change(Sender: TObject);
begin
  Chart1.Legend.TextSymbolGap:=StrToInt(Edit3.Text);
  Chart1.Refresh;
end;

procedure TLegendTextSymbolGapForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TLegendTextSymbolGapForm.cbAutomaticWidthsClick(Sender: TObject);
begin
  inherited;

  Chart1.Legend.ColumnWidthAuto:=cbAutomaticWidths.Checked;
  Chart1.Refresh;

  Edit1.Enabled:=not Chart1.Legend.ColumnWidthAuto;
  Edit2.Enabled:=not Chart1.Legend.ColumnWidthAuto;
  Edit3.Enabled:=not Chart1.Legend.ColumnWidthAuto;
  UpDown1.Enabled:=not Chart1.Legend.ColumnWidthAuto;
  UpDown2.Enabled:=not Chart1.Legend.ColumnWidthAuto;
  UpDown3.Enabled:=not Chart1.Legend.ColumnWidthAuto;

  Edit1.Text:=IntToStr(Chart1.Legend.ColumnWidths[0]);
  Edit2.Text:=IntToStr(Chart1.Legend.ColumnWidths[1]);
  Edit3.Text:=IntToStr(Chart1.Legend.TextSymbolGap);
end;

initialization
  RegisterClass(TLegendTextSymbolGapForm);
end.
