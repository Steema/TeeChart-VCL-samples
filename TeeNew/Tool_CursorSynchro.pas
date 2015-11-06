unit Tool_CursorSynchro;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,

  {$IFDEF UCL}
  UGraphics, UControls, UForms, UDialogs, UExtCtrls, UStdCtrls, UComCtrls,
  {$ELSE}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  {$ENDIF}

  Base, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TCursorSynchro = class(TBaseForm)
    Series1: TFastLineSeries;
    ChartTool1: TCursorTool;
    Chart2: TChart;
    Splitter1: TSplitter;
    Series2: TFastLineSeries;
    ChartTool2: TCursorTool;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    procedure ChartTool1Change(Sender: TCursorTool; x, y: Integer;
      const XValue, YValue: Double; Series: TChartSeries;
      ValueIndex: Integer);
    procedure ChartTool2Change(Sender: TCursorTool; x, y: Integer;
      const XValue, YValue: Double; Series: TChartSeries;
      ValueIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowXY(Const X,Y:Double);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

// This procedure synchronizes two cursors.
// "Source" is the original cursor, and "Dest" the cursor
// that is re-positioned.

Procedure CursorSynchronize( Source, Dest: TCursorTool );
begin
  Dest.ParentChart.AutoRepaint:=False; // stop repainting
  Dest.RedrawCursor;   // hide cursor

  Dest.YValue := Source.YValue;
  Dest.XValue := Source.XValue;

  Dest.RedrawCursor;  // draw cursor again
  Dest.ParentChart.AutoRepaint:=True; // enable repainting
end;

procedure TCursorSynchro.ChartTool1Change(Sender: TCursorTool; x,
  y: Integer; const XValue, YValue: Double; Series: TChartSeries;
  ValueIndex: Integer);
begin
  if CheckBox2.Checked then
     CursorSynchronize( Sender, ChartTool2 );

  ShowXY(XValue,YValue);
end;

procedure TCursorSynchro.ChartTool2Change(Sender: TCursorTool; x,
  y: Integer; const XValue, YValue: Double; Series: TChartSeries;
  ValueIndex: Integer);
begin
  if CheckBox2.Checked then
     CursorSynchronize( Sender, ChartTool1 );

  ShowXY(XValue,YValue);
end;

procedure TCursorSynchro.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(1000);
  Series2.DataSource:=Series1;

  { move Cursor to center }
  ChartTool1.XValue:=500;
  ChartTool1.YValue:=(Series1.YValues.MaxValue+Series1.YValues.MinValue)/2;
end;

procedure TCursorSynchro.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.FollowMouse:=CheckBox1.Checked;
  ChartTool2.FollowMouse:=CheckBox1.Checked;
end;

Procedure TCursorSynchro.ShowXY(Const X,Y:Double);
begin
  Label1.Caption:=FormatFloat('#.00',X)+'   '+FormatFloat('#.00',Y);
end;

initialization
  RegisterClass(TCursorSynchro);
end.
