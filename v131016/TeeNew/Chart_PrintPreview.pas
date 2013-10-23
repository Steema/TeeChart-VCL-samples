unit Chart_PrintPreview;
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
  Base, TeeProcs, TeEngine, Chart, TeeSurfa, TeeMapSeries, TeeEdit;

type
  TChartPrintPreviewForm = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Series1: TMapSeries;
    Button3: TButton;
    ChartPreviewer1: TChartPreviewer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeEdiGene, TeePrevi;  { <-- the "print preview" unit }

procedure TChartPrintPreviewForm.Button1Click(Sender: TObject);
begin
  { WAY 1: using a single method... }
  ChartPreview( Self, Chart1 );  {  <--- the easy way... }
end;

procedure TChartPrintPreviewForm.Button2Click(Sender: TObject);
begin
  { WAY 2, customizing the print preview dialog }

  { customize the preview dialog .... }
  With TChartPreview.Create(Self) do
  try
    { important: set the chart to be previewed... }
    PreviewPanel.Panel:=Self.Chart1;

    { important: set the Navigator class... }
    PageNavigatorClass:=TChartPageNavigator;

    { example: change the "paper color" }
    PreviewPanel.PaperColor:=clSilver;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TChartPrintPreviewForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(15);
end;

procedure TChartPrintPreviewForm.Button3Click(Sender: TObject);
begin
  { WAY 3: Using the TChartPreviewer component }
  ChartPreviewer1.Execute;
end;

initialization
  RegisterClass(TChartPrintPreviewForm);
end.
