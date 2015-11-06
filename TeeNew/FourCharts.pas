unit FourCharts;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeePenDlg, TeeGDIPlus;

type
  TFourChartsForm = class(TForm)
    Panel1: TPanel;
    Chart1: TChart;
    Winter: TLineSeries;
    Summer: TLineSeries;
    Chart2: TChart;
    BarSeries1: TBarSeries;
    Panel2: TPanel;
    Chart3: TChart;
    South: TAreaSeries;
    North: TAreaSeries;
    Chart4: TChart;
    Speaking: TPointSeries;
    Writing: TPointSeries;
    Reading: TPointSeries;
    Panel3: TPanel;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TFourChartsForm.FormCreate(Sender: TObject);
var t : Integer;
begin
  { Some random points }
  Summer.FillSampleValues(20);
  Winter.FillSampleValues(20);

  { We need a Bar Series with special random values,
    so dont call the FillSampleValues method }
  With BarSeries1 do
  for t:=1 to 12 do
      Add(Random(1000),
          {$IFDEF D15}FormatSettings.{$ENDIF}ShortMonthNames[t],
          GetDefaultColor(t));

  South.FillSampleValues(20);
  North.FillSampleValues(20);

  Speaking.FillSampleValues(20);
  Reading.FillSampleValues(20);
  Writing.FillSampleValues(20);
end;

procedure TFourChartsForm.Button1Click(Sender: TObject);
var tmpH,tmpW : Integer;
begin
 { This code creates and stores a new BITMAP file
   which contains the FOUR charts.
   It asks previously the end user for the BMP filename
   where to save the bitmap.
 }
  with SaveDialog1 do
  begin
    if Execute then
    With TBitmap.Create do
    try
      { calculate bitmap size (2x2) }
      tmpW:=Chart1.Width;
      tmpH:=Chart1.Height;
      Width := 2*tmpW;
      Height:= 2*tmpH;

      { draw chart 1 }
      Chart1.BufferedDisplay:=False;
      Chart1.Draw(Canvas,Rect(0,0,tmpW,tmpH));
      Chart1.BufferedDisplay:=True;

      { draw chart 2 }
      Chart2.BufferedDisplay:=False;
      Chart2.Draw(Canvas,Rect(0,tmpH+1,tmpW,2*tmpH));
      Chart2.BufferedDisplay:=True;

      { draw chart 3 }
      Chart3.BufferedDisplay:=False;
      Chart3.Draw(Canvas,Rect(tmpW+1,0,2*tmpW,tmpH));
      Chart3.BufferedDisplay:=True;

      { draw chart 4 }
      Chart4.BufferedDisplay:=False;
      Chart4.Draw(Canvas,Rect(tmpW+1,tmpH+1,2*tmpW,2*tmpH));
      Chart4.BufferedDisplay:=True;
      SaveToFile(FileName);
    finally
      Free;
    end;
  end;
end;

initialization
  RegisterClass(TFourChartsForm);
end.
