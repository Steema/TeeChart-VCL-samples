unit Marks_OnTop;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeComma;

type
  TMarksOnTop = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    ChartTool1: TColorLineTool;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TMarksOnTop.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
  Series2.FillSampleValues;
  Series3.FillSampleValues;

  CheckBox1Click(Self);
end;

procedure TMarksOnTop.CheckBox1Click(Sender: TObject);
var i: Integer;
begin
  for i:=0 to Chart1.SeriesCount-1 do
    Chart1[i].Marks.OnTop:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TMarksOnTop);
end.
