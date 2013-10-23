unit Tool_Cursor;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, Series, TeeEdit;

type
  TCursorToolDemo = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    ChartTool1: TCursorTool;
    Series2: TFastLineSeries;
    ChartTool2: TCursorTool;
    ChartTool3: TColorLineTool;
    Series1: TFastLineSeries;
    Button1: TButton;
    ChartEditor1: TChartEditor;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChartTool1Change(Sender: TCursorTool; x, y: Integer;
      const XValue, YValue: Double; Series: TChartSeries;
      ValueIndex: Integer);
    procedure CheckBox2Click(Sender: TObject);
    procedure ChartTool2Change(Sender: TCursorTool; x, y: Integer;
      const XValue, YValue: Double; Series: TChartSeries;
      ValueIndex: Integer);
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

procedure TCursorToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked   { enable / disable the first cursor }
end;

procedure TCursorToolDemo.ChartTool1Change(Sender: TCursorTool; x, y: Integer;
  const XValue, YValue: Double; Series: TChartSeries; ValueIndex: Integer);
begin
  { show the cursor values... }
  Label1.Caption:=FormatFloat('#.00',XValue)+','+FormatFloat('#.00',YValue);
end;

procedure TCursorToolDemo.CheckBox2Click(Sender: TObject);
begin
  { set / unset cursor "Snap" (automatic moving of cursor to points) }
  ChartTool1.Snap:=CheckBox2.Checked;
  { change the cursor style... }
  ChartTool1.Style:=cssVertical;
end;

procedure TCursorToolDemo.ChartTool2Change(Sender: TCursorTool; x, y: Integer;
  const XValue, YValue: Double; Series: TChartSeries; ValueIndex: Integer);
begin
  { show cursor values }
  Label2.Caption:=FormatFloat('#.00',XValue)+','+FormatFloat('#.00',YValue);
end;

procedure TCursorToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(100);
  
  Chart1.LeftAxis.Minimum:=0;
end;

procedure TCursorToolDemo.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute  { show the chart editor dialog }
end;

initialization
  RegisterClass(TCursorToolDemo);
end.
