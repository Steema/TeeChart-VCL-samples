unit Chart_MultiClipboard;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}  
  Base, TeeProcs, TeEngine, Chart, Series, TeeGDIPlus;

type
  TChartMultiClipboard = class(TBaseForm)
    Chart2: TChart;
    Chart3: TChart;
    Series1: TLineSeries;
    Series2: TBarSeries;
    Series3: TAreaSeries;
    Button1: TButton;
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

Uses {$IFDEF CLX}QClipbrd{$ELSE}Clipbrd{$ENDIF};

procedure TChartMultiClipboard.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
  Series2.FillSampleValues(6);
  Series3.FillSampleValues(26);
end;

procedure TChartMultiClipboard.Button1Click(Sender: TObject);
Var Bitmap : TBitmap;

   Procedure DrawChart(Chart:TChart; Const Rect:TRect);
   begin
     { disable using the internal "buffer" image... }
     Chart.BufferedDisplay:=False;
     try
       { draw the chart to the bitmap at the "Rect" position... }
       Chart.Draw(Bitmap.Canvas,Rect);
     finally
       { enable again the internal buffer image... }
       Chart.BufferedDisplay:=True;
     end;
   end;

begin
  { create a temporary bitmap image... }
  Bitmap := TBitmap.Create;
  try
    { set the bitmap dimensions... }
    Bitmap.Width:=500;
    Bitmap.Height:=300;

    { draw the 3 charts... }
    DrawChart(Chart1,Rect(251,0,500-1,125));
    DrawChart(Chart2,Rect(0,0,250,125));
    DrawChart(Chart3,Rect(0,126,500-1,300-1));

    { finally, copy the image to clipboard... }
    Clipboard.Assign(Bitmap);
  finally
    { remove the temporary bitmap... }
    Bitmap.Free;
  end;
end;

initialization
  RegisterClass(TChartMultiClipboard);
end.
