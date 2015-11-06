unit Tools_Custom;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools;

type
  TAxisLabelToolDemo = class(TBaseForm)
    Series1: TBarSeries;
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

Uses TeeAxisLabelTool;  { <-- here it is the custom tool... }

procedure TAxisLabelToolDemo.FormCreate(Sender: TObject);
Var AxisLabelTool : TAxisLabelTool;
begin
  inherited;
  { sample values for the series }
  Series1.AddArray([8,800,150,1500,2000,1000,120000,30000]);

  { create the custom tool }
  AxisLabelTool:=TAxisLabelTool.Create(Self);
  { set the chart }
  AxisLabelTool.ParentChart:=Chart1;

  { set the tool axis }
  AxisLabelTool.Axis:=Chart1.LeftAxis;
end;

procedure TAxisLabelToolDemo.CheckBox1Click(Sender: TObject);
begin
  Chart1.Tools[0].Active:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TAxisLabelToolDemo);
end.
